Add-Type -AssemblyName "System.Windows.Forms"
Add-Type -AssemblyName "System.Drawing"

# Criar uma janela de progresso
$ProgressForm = New-Object System.Windows.Forms.Form
$ProgressForm.Text = "Installing Dependencies..."
$ProgressForm.Size = New-Object System.Drawing.Size(400, 150)
$ProgressForm.StartPosition = "CenterScreen"

# Criar o controle de progresso
$ProgressBar = New-Object System.Windows.Forms.ProgressBar
$ProgressBar.Style = 'Marquee' # Tipo de barra de progresso (infinita)
$ProgressBar.Dock = 'Fill'
$ProgressForm.Controls.Add($ProgressBar)

# Criar o botão de cancelamento
$CancelButton = New-Object System.Windows.Forms.Button
$CancelButton.Text = "Cancel"
$CancelButton.Dock = 'Bottom'
$CancelButton.Add_Click({
    $ProgressForm.Close()  # Fecha o formulário
    exit  # Cancela o script
})
$ProgressForm.Controls.Add($CancelButton)

# Exibir a janela de progresso
$ProgressForm.Show()

# Iniciar a instalação das dependências
try {
    $scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
    $requirementsPath = Join-Path $scriptPath "..\req\requirements.txt"
    # Executar o comando de instalação sem mostrar a janela do terminal
    Start-Process "cmd.exe" -ArgumentList "/c pip install -r `"$requirementsPath`"" -NoNewWindow -Wait
} catch {
    # Caso algo dê errado
    [System.Windows.Forms.MessageBox]::Show("Error during installation: $($_.Exception.Message)", "Installation Failed", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
} finally {
    # Fechar a janela de progresso após a instalação
    $ProgressForm.Close()

    # Mostrar a janela de conclusão
    [System.Windows.Forms.MessageBox]::Show("Installation Complete!", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}
