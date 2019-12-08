# visualize_network_traffic
ネットワークトラフィックのフロー情報を可視化します。

## ELK6
Vagrantでネットワークトラフィックのフロー情報をKibanaやGrafanaで表示する Ubuntu18.04 のVMを作成します。
VMは100GBの仮想ディスクと6GBの仮想メモリを使用します。
* NICから受信したパケットをYAFでフロー情報を抽出しIPfix形式に変換します。
* super_mediatorでIPfix形式をJSONファイルに変換します。
* JSONファイルをLogstash経由でElasticsearchに入力します。
* KibanaやGrafanaでElasticsearchに入力されたフロー情報を表示します。
* curlやwiresharkなどパケットの解析に用いるソフトウェアもインストールします。
* 作成されて30日以上経過した古いJSONファイルやElasticsearchのインデックスは自動的に削除されます。
* systemdからsuper_mediatorとyafを起動する様に変更しました。super_mediator.shやyaf.sh をshell から実行する必要はありません。
* yaf_ndpi.jsonを使用する場合、index pattern作成は不要です。
### 事前にインストールするソフトウェア
* VirtualBox
* Vagrant
* vagrant plugin install vagrant-disksize
* vagrant plugin install vagrant-proxyconf (if you use proxy)
* vagrant plugin install vagrant-vbguest (option)

### install
必要に応じてhttp_proxy, https_proxyの環境変数を設定してください。
vagrant up を実行し、パケットを受信するNICを選択します。
vagrant ssh を実行し、~/yaf/json にJSONファイルが存在することを確認します。

    $ export http_proxy="http://aaa.bbb.ccc.ddd:8080/" # if you use proxy
    $ export https_proxy="http://aaa.bbb.ccc.ddd:8080/" # if you use proxy
    $ vagrant plugin install vagrant-disksize
    $ vagrant plugin install vagrant-proxyconf # if you use proxy
    $ vagrant plugin install vagrant-vbguest # option
    $ cd ansible/ELK6/playbooks
    $ vagrant up
    (snip)
    (select network interface for packet capture)
    ==> default: Available bridged network interfaces:
    1) en1: Wi-Fi (AirPort)
    2) bridge0
    3) en0: Ethernet
    4) en2: Thunderbolt 1
    5) p2p0
    ==> default: When choosing an interface, it is usually the one that is
    ==> default: being used to connect to the internet.
        default: Which interface should the network bridge to? 3
    (snip)
    PLAY RECAP *********************************************************************
    testserver                 : ok=44   changed=40   unreachable=0    failed=0       
    
    $ vagrant ssh
    (snip)
    vagrant@ubuntu-xenial:~$ ls -l yaf/json
    total 2396
    -rw-r--r-- 1 root root 2447363 Dec 18 06:11 yaf.20181217154009.json
    vagrant@ubuntu-xenial:~$ 
    
### 使用方法 (kibana)
- http://127.0.0.1:5601/ をfirefox, chromeなどのブラウザで開きます。
- "Management" を選択します。
- "Saved Objects" を選択します。
- "Import" を押します。
- "Automatically overwrite all saved objects?"のチェックした状態で kibana6/yaf_ndpi.json をアップロードします。
- "Done" を押します。
- "Dashboard" を選択します。
- "main", "bar", "bar2", "bar2_nDPI", "circle" もしくは "circle2" を選択します。
- ダッシュボードにネットワークのトラフィック情報が表示されます。

### 使用方法 (grafana)
- http://127.0.0.1:3000/ をブラウザで開きます。
- username: admin password: admin でログインします。
- パスワードを変更します。
- "Add data source" を押します。
- "Choose data source type" から "Elasticsearch" を押します。
- Name に "yaf" を入力します。
- URL に "http://localhost:9200" を入力します。
- Elasticsearch details の Index Name に "yaf.*" を入力します。
- Elasticsearch deaiils の Versionselect から "6.0+" を選択します。
- "Save & Test" を押します。
- "+" を押し、 "Import" を選択します。
- "Upload .json File" を押します。
- "grafana/ElasticSearch YAF count.json" をアップロードします。
- "Select a Elasticsearch data source" から "yaf" を選択します。
- "Import" を押します。
- ElasticSearch YAF count のダッシュボードが表示されます。flow count, octetTotalCount, packetTotalCount について表示します。

## カスタマイズ
カスタマイズする際は
ansible/ELK6/playbooks/settings/config.yml
を作成後にインストールしてください。

### ansible/ELK6/playbooks/settings/config.yml の記載方法
- elasticstack_system

6.x, 7.x, opendistro_docker, opendistro_apt のいずれかを指定できます。
  - 6.x: 最新のElasticStack 6.x (デフォルト)
  - 7.x: 最新のElasticStack 7.x
  - opendistro_docker: Docker 版の opendistro for Elasticsearch 1.2.1
  - opendistro_apt: apt 版の opendistro for Elasticsearch 1.2.1

例:

    elasticstack_system: 7.x

- elasticsearch_vm

Elasticsearchが動作するVMの数を指定します。

elasticstack_system に 6.x, 7.x, opendistro_aptを指定した場合のみ3, 5を指定できます。

最初の1個のVMはメモリを6GB, 以降のVMは1個あたりメモリを4GB使用します。
  - 1: VMを1個作成し、メモリを6GB使用します。(デフォルト)
  - 3: VMを3個作成し、メモリを14GB使用します。
  - 5: VMを5個作成し、メモリを22GB使用します。

例:

    elasticsearch_vm: 3

### ToDo
- ドキュメント
