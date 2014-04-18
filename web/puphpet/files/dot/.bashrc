export PATH="/usr/local/rbenv/bin:$PATH"
eval "$(rbenv init -)"

rbenv_version=`rbenv versions`
pref_version="ruby 2.1.0p0"

# Install 2.1.0 if not present
if [[ "$rbenv_version/$pref_version" != "$rbenv_version" ]]; then
  rbenv install 2.1.0
  rbenv global 2.1.0
  rbenv rehash
  ruby -v
fi


cd /var/www
