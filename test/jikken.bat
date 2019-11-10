@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

# ����
Param($Arg1)
Write-Host $Arg1

# �t�@�C�����݃`�F�b�N
Write-Host "�t�@�C�����݃`�F�b�N"

if( -Not(Test-Path $Arg1) ){
    Write-Host '�w�肳�ꂽ�t�@�C���͑��݂��܂���B�������I�����܂��B'
    exit
}

# �A�C�e�����擾
$item = Get-Item $Arg1

# PSIsContainer �Ńt�@�C�����t�H���_���𔻒� https://bayashita.com/p/entry/show/229
Write-Host "�t�@�C�����t�H���_���𔻒�"
if($item.PSIsContainer)
{
    # �t�H���_�̏ꍇ�̏���
    Write-Host "$($item.Name)�̓t�H���_�ł��B"
}
else
{
    # �t�@�C���̏ꍇ�́E�E�E
    Write-Host "$($item.Name)�̓t�@�C���ł��B"

    # �e�t�H���_���A�C�e���Ƃ��čĎ擾
    # �o���V�^ �� PowerShell �� �t�@�C���E�t�H���_ �� �e�t�H���_�̐�΃p�X���擾������@ https://bayashita.com/p/entry/show/133
    $parent_folder = Split-Path $Arg1

    # �A�C�e�����Ď擾
    $item = Get-Item $parent_folder

    if ($item.PSIsContainer) {
        Write-Host "�A�C�e����$($item.Name)�Ƃ��čĎ擾����"
    }
}
Write-Host "�t���l�[�� $($item.FullName)"

# ���ϐ����݃`�F�b�N/�擾 - $env:���ϐ���
Write-Host "���ϐ����݃`�F�b�N/�擾"
if (Test-Path Env:Path) {
    Write-Host "Path"
    Write-Host $env:Path
}
if (Test-Path Env:Path2) {
    Write-Host "Path2"
    Write-Host $env:Path2
}
if (Test-Path Env:Path3) {
    Write-Host "Path3"
    Write-Host $env:Path3
}
if (Test-Path Env:Path4) {
    Write-Host "Path4"
    Write-Host $env:Path4
}

# �V�������ϐ��𐶐��B�V�K�^�㏑���ŏ����𕪊�B

# �V�K�̏ꍇ
if ( -Not(Test-Path Env:PathN) ) {
    Write-Host "new PathN"
    $NewPath = $item.FullName
}
# �ǉ��̏ꍇ
else
{
    Write-Host "add PathN"
    $NewPath = "$($env:PathN);$($item.FullName)"
}

# ���ϐ����Z�b�g
Write-Host "�Z�b�g�\�� $($NewPath)"
[Environment]::SetEnvironmentVariable('PATH', $Env:PathN, $NewPath)


Write-Host "---------------------------------------------------------------------------------------"
