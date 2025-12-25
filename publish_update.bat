@echo off
echo ==========================================
echo      KIDS PAINTING APP - PUBLISHER
echo ==========================================

echo 1. Building Release APK...
call flutter build apk --release
if %errorlevel% neq 0 (
    echo Build failed!
    pause
    exit /b %errorlevel%
)

echo 2. Copying APK to root...
copy /Y build\app\outputs\flutter-apk\app-release.apk app.apk

echo 3. Pushing to GitHub...
git add app.apk version.json publish_update.bat .gitignore
git commit -m "New Release Update"
git push

echo ==========================================
echo      SUCCESS! Update Published.
echo ==========================================
pause
