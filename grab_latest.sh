#!/bin/bash
FILELIST=$(curl -s https://api.github.com/repos/bromite/bromite/releases/latest \
| grep "browser_download_url" \
| awk '{print substr($2, 2, length($2)-2)}') \
; 
WebView=$(echo "$FILELIST" | grep "WebView")
mkdir -p temp
rm ./temp/*
wget $WebView -P ./temp
mv -f ./temp/arm64_SystemWebView.apk ./prebuilt/arm64/webview.apk
mv -f ./temp/arm_SystemWebView.apk ./prebuilt/arm/webview.apk
mv -f ./temp/x86_SystemWebView.apk ./prebuilt/x86/webview.apk
