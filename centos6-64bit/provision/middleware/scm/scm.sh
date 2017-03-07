#SCM
echo "---------- SCM ----------"

which -s git
if [[ $? != 0 ]] ; then
  echo "---------- Install: Git ----------"
  cd /etc/yum.repos.d/
  sudo wget wget http://wing-repo.net/wing/6/EL6.wing.repo
  sudo yum  --enablerepo=wing -y install git
  git --version
else
  git --version
fi


which -s svn
if [[ $? != 0 ]] ; then
  echo "---------- Install: SVN ----------"
  sudo yum -y install svn
else
  svn --version
fi

which -s hg
if [[ $? != 0 ]] ; then
  echo "---------- Install: HG ----------"
  sudo yum -y install hg
else
  hg --version
fi



