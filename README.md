# hello-argo-workflow

https://argoproj.github.io/argo-workflows/

![repo_image](https://user-images.githubusercontent.com/1106556/125167981-369a4000-e1de-11eb-873e-2f66ae7557c0.png)

## Usage

### 1. GKEクラスタの新規作成等

./terraformのマニュフェストをapplyしてインフラ構築していきます。
[Autopilotモード](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview?authuser=1)モードでGKEクラスタが新規作成されます

1. 認証

```
$ make -C terraform auth
```

コマンドの出力メッセージに従ってリンクをブラウザで開き、二段階認証等をすすめてきます。

2. terraform apply

```
$ make -C terraform init plan
$ make -C terraform apply
```

クラスタが起動するまで5分くらい待って... :coffee:

3. 確認

接続

```
$ gcloud container clusters get-credentials <name> --region <region> --project <project>
```

確認

```
$ kubectl cluster-info
```

### 2. argo-workflowのインストール、ジョブの実行

#### 2.1 argo-workflowのインストール

```
$ kubectl create namespace argo
$ kubectl apply -n argo -f k8s/argo-workflow.yaml
```

GKEの場合は、クラスタ管理の権限をユーザに付与し

```
kubectl create clusterrolebinding YOURNAME-cluster-admin-binding --clusterrole=cluster-admin --user=YOUREMAIL@gmail.com
```

WebUIにアクセス

```
kubectl -n argo port-forward deployment/argo-server 2746:2746
```

```
open https://localhost:2746
```

参考: https://github.com/argoproj/argo-workflows/blob/master/docs/quick-start.md


#### 2.2 ジョブの実行

argoコマンドをインストールし

```
brew install argoproj/tap/argo
```

ジョブを実行、確認する
```
argo submit -n argo workflows/hello-world.yaml
argo list -n argo
argo get -n argo @latest
argo logs -n argo @latest
```

<img width="1619" alt="スクリーンショット" src="https://user-images.githubusercontent.com/1106556/125168021-5893c280-e1de-11eb-8ffe-35e2eeb93008.png">


### Access the Argo Workflows UI

参考: https://github.com/argoproj/argo-workflows/blob/master/docs/argo-server.md#access-the-argo-workflows-ui
