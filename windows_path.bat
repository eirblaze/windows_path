@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" ""%*""&goto:eof

# ����
Param($Arg1)
Write-Debug $Arg1

# �t�@�C�����݃`�F�b�N
Write-Debug "�t�@�C�����݃`�F�b�N"

if( -Not(Test-Path $Arg1) ){
    Write-Debug '�w�肳�ꂽ�t�@�C���͑��݂��܂���B�������I�����܂��B'
    exit
}

# �A�C�e�����擾
$item = Get-Item $Arg1

# PSIsContainer �Ńt�@�C�����t�H���_���𔻒� https://bayashita.com/p/entry/show/229
Write-Debug "�t�@�C�����t�H���_���𔻒�"
if($item.PSIsContainer)
{
    # �t�H���_�̏ꍇ�̏���
    Write-Debug "$($item.Name)�̓t�H���_�ł��B"
}
else
{
    # �t�@�C���̏ꍇ�́E�E�E
    Write-Debug "$($item.Name)�̓t�@�C���ł��B"

    # �e�t�H���_���A�C�e���Ƃ��čĎ擾
    # �o���V�^ �� PowerShell �� �t�@�C���E�t�H���_ �� �e�t�H���_�̐�΃p�X���擾������@ https://bayashita.com/p/entry/show/133
    $parent_folder = Split-Path $Arg1

    # �A�C�e�����Ď擾
    $item = Get-Item $parent_folder

    if ($item.PSIsContainer) {
        Write-Debug "�A�C�e����$($item.Name)�Ƃ��čĎ擾����"
    }
}
Write-Debug "�t���l�[�� $($item.FullName)"

# �V�������ϐ��𐶐��B�V�K�^�㏑���ŏ����𕪊�B

# �V�K�̏ꍇ
if ( -Not(Test-Path Env:Path2) ) {
    # �V����������𐶐�
    Write-Debug "new Path2"
    $NewPath = $item.FullName
}
# �ǉ��̏ꍇ
else
{
    # �V����������𐶐�
    Write-Debug "add Path2"
    $NewPath = "$($env:Path2);$($item.FullName)"
}

# ���ϐ����Z�b�g
Write-Debug "�Z�b�g�\�� $($NewPath)"
[Environment]::SetEnvironmentVariable('Path2', $NewPath, 'User')

Write-Debug "���݂�env:Path2 $($env:Path2)"

Write-Debug "---------------------------------------------------------------------------------------"
