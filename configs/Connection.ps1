######## CREATED BY RENAN ZANELATO GIT @renanzanelato LINKEDIN @renan-zanelato ########

class Connection
{
    [System.Data.SqlClient.SqlConnection] $SqlConnection;
    [String] $ConnectionString;

    Connection( [Helper] $Helper){
        
        $this.ConnectionString="Server=$($Helper.Server);UID=$($Helper.UID);Integrated Security=true;";
        $this.SqlConnection = New-Object System.Data.SqlClient.SqlConnection;
        $this.SqlConnection.ConnectionString = $this.ConnectionString;
 
    }
    ExecuteQuery([string] $SQLQuery){
        $this.SqlConnection.Open();
        $Command = New-Object System.Data.SQLClient.SQLCommand;
        $Command.Connection = $this.SqlConnection;
        $Command.CommandText = $SQLQuery;
        $Command.CommandTimeout = 1999;
        $Command.ExecuteReader();
        $this.SqlConnection.Close();
    }
}