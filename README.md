# tasker

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 環境
* Flutter: 3.29.2
* 検証済み動作環境:
  * macOS 15.3.2以降
  * Apple M1 Pro

# build_runner
Freezedを使用しているため、必要な場合は都度ビルドが必要

VSCodeなら
1. Macは（Command + Shift + P）
2. Run Task（タスクの実行）を選択
3. `build_runner build`を実行


# Firebase
Firebase Firestore Databaseを使用している

## インストール
Firebase公式のFlutter用[ドキュメント](https://firebase.google.com/docs/flutter/setup?hl=ja&platform=android#install-cli-tools)に則る
バージョンによって内容が異なる場合があるため、以下の手順で問題が発生する場合は公式資料を参考にする
実装当時の内容を以下に示す

1. Firebase [CLIのインストール](https://firebase.google.com/docs/cli?hl=ja&_gl=1*4aos44*_up*MQ..*_ga*MTY3NjA2MjM4My4xNzQzOTEzNjcy*_ga_CW55HF8NVT*MTc0MzkxMzY3Mi4xLjAuMTc0MzkxMzY3Mi4wLjAuMA..#setup_update_cli)を行う
2. firebase login
   1. Firebaseプロジェクトの権限を持ったアカウントでログイン
3. dart pub global activate flutterfire_cli
4. flutterfire configure
   1. プロジェクト情報が`構成されている`とその情報を元に再構築するか聞かれるため、`Yes`でそのままの構成を利用
   2. プロジェクト情報が`構成されていない`とログインしたアカウントのプロジェクトリストが表示されるため、任意に選択して構成するプラットフォームを選択


