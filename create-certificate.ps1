
# if ( -not (Test-Path -LiteralPath 'C:\Windows' -PathType Leaf) ) 
#     { 
#         New-Item -ItemType Directory -Path C:\certs
#     }

    if (-not (Test-Path -LiteralPath C:\certs)) {
    
        try {
            New-Item -Path C:\certs -ItemType Directory -ErrorAction Stop | Out-Null #-Force
        }
        catch {
            Write-Error -Message "Unable to create directory. Error was: $_" -ErrorAction Stop
        }
        "Successfully created directory."
    
    }
    else {
        "Directory already existed"
    }


Set-Location -Path C:\certs
openssl req -new -out MyFirst.csr
openssl genrsa -out rsa.private 2048