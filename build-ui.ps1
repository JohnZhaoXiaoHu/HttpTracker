$BlazorPath = Get-ChildItem -Path "src\**\*.Blazor.csproj"
$PublishPath = ".\src\HttpTracker.Dashboard.Blazor\publish"
$Destination = ".\src\HttpTracker.Dashboard\Blazor"

echo "***** ������Ŀ *****"
dotnet publish -c Release $BlazorPath -p:PublishDir=publish

echo "***** �Ƴ��ɵ��ļ������� *****"
Remove-Item $Destination -Force -Recurse

echo "***** Ǩ�Ʒ����ļ� *****"
Copy-Item -Path $PublishPath\wwwroot -Destination $Destination -Recurse -Force -Passthru

echo "***** �Ƴ������ļ� *****"
Remove-Item $PublishPath -Force -Recurse

echo "***** done *****"