@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

# ����
Param($Arg1)
Write-Host $Arg1

# �t�@�C�����݃`�F�b�N
Write-Host "�t�@�C�����݃`�F�b�N"
Test-Path $Arg1

# �o���V�^ �� PowerShell �� �t�@�C���E�t�H���_ �� �e�t�H���_�̐�΃p�X���擾������@ https://bayashita.com/p/entry/show/133
Write-Host "�e�t�H���_�̐�΃p�X���擾����"
$parent_folder = Split-Path $Arg1
Test-Path $parent_folder

# PSIsContainer �Ńt�@�C�����t�H���_���𔻒� https://bayashita.com/p/entry/show/229
Write-Host "�t�@�C�����t�H���_���𔻒�"
if($Arg1.PSIsContainer)
{
    # �t�H���_�̏ꍇ�̏���
    Write-Host '�t�H���_�ł��B'
}
else
{
    # �t�@�C���̏ꍇ�̏���
    Write-Host '�t�@�C���ł��B'
}

# ���ϐ����݃`�F�b�N
Test-Path Env:Path
Test-Path Env:Path2
Test-Path Env:Path3
Test-Path Env:Path4

# ���ϐ��擾 - $env:���ϐ���
Write-Host "Path"
Write-Host $env:Path
Write-Host "Path2"
Write-Host $env:PATH2

# ���ϐ����Z�b�g�B�V�K�^�㏑��
