######## CREATED BY RENAN ZANELATO GIT @renanzanelato LINKEDIN @renan-zanelato ########

class Messages
{
	ShowMessageException([string] $StringMessage)
    {
        Write-Host -Foreground Red -Background Black "##########################################################";
        Write-Host -Foreground Red -Background Black "# $StringMessage";
        Write-Host -Foreground Red -Background Black "##########################################################";
        exit;
    }
    ShowMessageStartingOk([string] $StringMessage)
    {
        Write-Host -Foreground Green -Background Black "##########################################################";
        Write-Host -Foreground Green -Background Black "# $StringMessage";
        Write-Host -Foreground Green -Background Black "##########################################################";
    }
    ShowMessageWarning([string] $StringMessage)
    {
        Write-Host -Foreground DarkYellow -Background Black "##########################################################";
        Write-Host -Foreground DarkYellow -Background Black "# $StringMessage";
        Write-Host -Foreground DarkYellow -Background Black "##########################################################";
    }
}