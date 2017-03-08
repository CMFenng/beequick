set /p txt=你是谁？
git add --all
git commit -m "commit by %txt%"
git push
pause