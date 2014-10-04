



<!DOCTYPE html>
<html lang="en" class="">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    
    
    <title>QGIS-Documentation/general_tools.rst at master · andremano/QGIS-Documentation</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="andremano/QGIS-Documentation" name="twitter:title" /><meta content="Contribute to QGIS-Documentation development by creating an account on GitHub." name="twitter:description" /><meta content="https://avatars3.githubusercontent.com/u/6665872?v=2&amp;s=400" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars3.githubusercontent.com/u/6665872?v=2&amp;s=400" property="og:image" /><meta content="andremano/QGIS-Documentation" property="og:title" /><meta content="https://github.com/andremano/QGIS-Documentation" property="og:url" /><meta content="Contribute to QGIS-Documentation development by creating an account on GitHub." property="og:description" />

      <meta name="browser-stats-url" content="/_stats">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035">
    <link rel="xhr-socket" href="/_sockets">
    <meta name="pjax-timeout" content="1000">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>
      <meta name="google-analytics" content="UA-3769691-2">

    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="C19F5DCC:76FB:311995DD:542FFCCB" name="octolytics-dimension-request_id" /><meta content="6665872" name="octolytics-actor-id" /><meta content="andremano" name="octolytics-actor-login" /><meta content="beea2b694409d1bf711e70316825fb06e385832e0bda128d2b90f08ca890c22b" name="octolytics-actor-hash" />
    <meta content="Rails, view, blob#show" name="analytics-event" />

    
    
    <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">


    <meta content="authenticity_token" name="csrf-param" />
<meta content="sQQnMzuMoi1dQzE0DI/YZ5Mj+qZ8PFviQtDPzFaGUHW5CYs5ervADDa6lIKTcn4FNntaAqQCnaK4PsJ+HGAt+w==" name="csrf-token" />

    <link href="https://assets-cdn.github.com/assets/github-7ac1eb11eed98adb8eb769d637e00db1cb2c02f9.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://assets-cdn.github.com/assets/github2-9ae9325bdf8dd21253fde438acbd4e158d45b029.css" media="all" rel="stylesheet" type="text/css" />
    


    <meta http-equiv="x-pjax-version" content="1059a99e7bf3380b10f57c485232e692">

      
  <meta name="description" content="Contribute to QGIS-Documentation development by creating an account on GitHub.">
  <meta name="go-import" content="github.com/andremano/QGIS-Documentation git https://github.com/andremano/QGIS-Documentation.git">

  <meta content="6665872" name="octolytics-dimension-user_id" /><meta content="andremano" name="octolytics-dimension-user_login" /><meta content="24726895" name="octolytics-dimension-repository_id" /><meta content="andremano/QGIS-Documentation" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="true" name="octolytics-dimension-repository_is_fork" /><meta content="8466379" name="octolytics-dimension-repository_parent_id" /><meta content="qgis/QGIS-Documentation" name="octolytics-dimension-repository_parent_nwo" /><meta content="8466379" name="octolytics-dimension-repository_network_root_id" /><meta content="qgis/QGIS-Documentation" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/andremano/QGIS-Documentation/commits/master.atom" rel="alternate" title="Recent Commits to QGIS-Documentation:master" type="application/atom+xml">

  </head>


  <body class="logged_in  env-production windows vis-public fork page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div class="wrapper">
      
      
      
      


      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" ga-data-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <form accept-charset="UTF-8" action="/andremano/QGIS-Documentation/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/andremano/QGIS-Documentation/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <input type="text"
    class="js-site-search-field is-clearable"
    data-hotkey="s"
    name="q"
    placeholder="Search"
    data-global-scope-placeholder="Search GitHub"
    data-repo-scope-placeholder="Search"
    tabindex="1"
    autocapitalize="off">
  <div class="scope-badge">This repository</div>
</form>
      </div>
      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item explore">
          <a class="header-nav-link" href="/explore" data-ga-click="Header, go to explore, text:explore">Explore</a>
        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="/blog" data-ga-click="Header, go to blog, text:blog">Blog</a>
          </li>
        <li class="header-nav-item">
          <a class="header-nav-link" href="https://help.github.com" data-ga-click="Header, go to help, text:help">Help</a>
        </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name" href="/andremano" data-ga-click="Header, go to profile, text:username">
      <img alt="andremano" class="avatar" data-user="6665872" height="20" src="https://avatars1.githubusercontent.com/u/6665872?v=2&amp;s=40" width="20" />
      <span class="css-truncate">
        <span class="css-truncate-target">andremano</span>
      </span>
    </a>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link js-menu-target tooltipped tooltipped-s" href="#" aria-label="Create new..." data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      
<ul class="dropdown-menu">
  <li>
    <a href="/new"><span class="octicon octicon-repo"></span> New repository</a>
  </li>
  <li>
    <a href="/organizations/new"><span class="octicon octicon-organization"></span> New organization</a>
  </li>


    <li class="dropdown-divider"></li>
    <li class="dropdown-header">
      <span title="andremano/QGIS-Documentation">This repository</span>
    </li>
      <li>
        <a href="/andremano/QGIS-Documentation/settings/collaboration"><span class="octicon octicon-person"></span> New collaborator</a>
      </li>
</ul>

    </div>
  </li>

  <li class="header-nav-item">
        <a href="/notifications" aria-label="You have unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:unread" data-hotkey="g n">
        <span class="mail-status unread"></span>
        <span class="octicon octicon-inbox"></span>
</a>
  </li>

  <li class="header-nav-item">
    <a class="header-nav-link tooltipped tooltipped-s" href="/settings/profile" id="account_settings" aria-label="Settings" data-ga-click="Header, go to settings, icon:settings">
      <span class="octicon octicon-gear"></span>
    </a>
  </li>

  <li class="header-nav-item">
    <form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ByhYTfxvNniM5bzzS51e+YZHrX6YqUxiawA9WPNroCVRmCHYBLxZqvzxKhw7P+P0ETi/QiNl0G/PwWSTy/URgQ==" /></div>
      <button class="header-nav-link sign-out-button tooltipped tooltipped-s" aria-label="Sign out" data-ga-click="Header, sign out, icon:logout">
        <span class="octicon octicon-sign-out"></span>
      </button>
</form>  </li>

</ul>


    
  </div>
</div>

      

        


      <div id="start-of-content" class="accessibility-aid"></div>
          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    <div id="js-flash-container">
      
    </div>
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        
<ul class="pagehead-actions">

    <li class="subscription">
      <form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="zf1vnQrmzRilutZr4IHeWr7Zljc+E0XnZmEwiZKkcBQ3h0/ePXLhFecjvRlBdLB3u3Q0jcrKaRFj7FtEVF9Uyw==" /></div>  <input id="repository_id" name="repository_id" type="hidden" value="24726895" />

    <div class="select-menu js-menu-container js-select-menu">
      <a class="social-count js-social-count" href="/andremano/QGIS-Documentation/watchers">
        1
      </a>
      <a href="/andremano/QGIS-Documentation/subscription"
        class="minibutton select-menu-button with-count js-menu-target" role="button" tabindex="0" aria-haspopup="true">
        <span class="js-select-button">
          <span class="octicon octicon-eye"></span>
          Unwatch
        </span>
      </a>

      <div class="select-menu-modal-holder">
        <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
          <div class="select-menu-header">
            <span class="select-menu-title">Notifications</span>
            <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-list js-navigation-container" role="menu">

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_included" name="do" type="radio" value="included" />
                <h4>Not watching</h4>
                <span class="description">Be notified when participating or @mentioned.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Watch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                <h4>Watching</h4>
                <span class="description">Be notified of all conversations.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-eye"></span>
                  Unwatch
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

            <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <div class="select-menu-item-text">
                <input id="do_ignore" name="do" type="radio" value="ignore" />
                <h4>Ignoring</h4>
                <span class="description">Never be notified.</span>
                <span class="js-select-button-text hidden-select-button-text">
                  <span class="octicon octicon-mute"></span>
                  Stop ignoring
                </span>
              </div>
            </div> <!-- /.select-menu-item -->

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

</form>
    </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <form accept-charset="UTF-8" action="/andremano/QGIS-Documentation/unstar" class="js-toggler-form starred js-unstar-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="mEWJtDf+Frl+5j/jtuyvOByoqA+nkEaU0Fu5qmV3WtONEF7VUQmijK/gQnyWD/2DPZZXW7OI39vd0qaJ3tiB3g==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Unstar this repository" title="Unstar andremano/QGIS-Documentation">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/andremano/QGIS-Documentation/stargazers">
          0
        </a>
</form>
    <form accept-charset="UTF-8" action="/andremano/QGIS-Documentation/star" class="js-toggler-form unstarred js-star-button" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="LjqLq8QK65KAlikk/nu7NhEX/oJ5tqhFTvnH6ARtsmk8I8xnJQGWJ7BBjNHFxrko7jrM+vGed0soML1tuD/32w==" /></div>
      <button
        class="minibutton with-count js-toggler-target star-button"
        aria-label="Star this repository" title="Star andremano/QGIS-Documentation">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/andremano/QGIS-Documentation/stargazers">
          0
        </a>
</form>  </div>

  </li>


        <li>
          <a href="/andremano/QGIS-Documentation/fork" class="minibutton with-count js-toggler-target fork-button tooltipped-n" title="Fork your own copy of andremano/QGIS-Documentation to your account" aria-label="Fork your own copy of andremano/QGIS-Documentation to your account" rel="nofollow" data-method="post">
            <span class="octicon octicon-repo-forked"></span>
            Fork
          </a>
          <a href="/andremano/QGIS-Documentation/network" class="social-count">81</a>
        </li>

</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="mega-octicon octicon-repo-forked"></span>
          <span class="author"><a href="/andremano" class="url fn" itemprop="url" rel="author"><span itemprop="title">andremano</span></a></span><!--
       --><span class="path-divider">/</span><!--
       --><strong><a href="/andremano/QGIS-Documentation" class="js-current-repository js-repo-home-link">QGIS-Documentation</a></strong>

          <span class="page-context-loader">
            <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

            <span class="fork-flag">
              <span class="text">forked from <a href="/qgis/QGIS-Documentation">qgis/QGIS-Documentation</a></span>
            </span>
        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            
<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders" role="navigation" data-issue-count-url="/andremano/QGIS-Documentation/issues/counts">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Code">
        <a href="/andremano/QGIS-Documentation" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-hotkey="g c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /andremano/QGIS-Documentation">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


      <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
        <a href="/andremano/QGIS-Documentation/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g p" data-selected-links="repo_pulls /andremano/QGIS-Documentation/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class="js-pull-replace-counter"></span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped tooltipped-w" aria-label="Wiki">
          <a href="/andremano/QGIS-Documentation/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-hotkey="g w" data-selected-links="repo_wiki /andremano/QGIS-Documentation/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>
    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped tooltipped-w" aria-label="Pulse">
        <a href="/andremano/QGIS-Documentation/pulse/weekly" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /andremano/QGIS-Documentation/pulse/weekly">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped tooltipped-w" aria-label="Graphs">
        <a href="/andremano/QGIS-Documentation/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /andremano/QGIS-Documentation/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


      <div class="sunken-menu-separator"></div>
      <ul class="sunken-menu-group">
        <li class="tooltipped tooltipped-w" aria-label="Settings">
          <a href="/andremano/QGIS-Documentation/settings" aria-label="Settings" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_settings /andremano/QGIS-Documentation/settings">
            <span class="octicon octicon-tools"></span> <span class="full-word">Settings</span>
            <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>
      </ul>
  </div>
</div>

              <div class="only-with-full-nav">
                
  
<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=push">
  <h3><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="https://github.com/andremano/QGIS-Documentation.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/andremano/QGIS-Documentation.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="ssh"
  data-url="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push">
  <h3><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="git@github.com:andremano/QGIS-Documentation.git" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="git@github.com:andremano/QGIS-Documentation.git" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push">
  <h3><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group">
    <input type="text" class="input-mini input-monospace js-url-field"
           value="https://github.com/andremano/QGIS-Documentation" readonly="readonly">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="https://github.com/andremano/QGIS-Documentation" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
      <a href="#" class="js-clone-selector" data-protocol="ssh">SSH</a>,
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</p>


  <a href="github-windows://openRepo/https://github.com/andremano/QGIS-Documentation" class="minibutton sidebar-button" title="Save andremano/QGIS-Documentation to your computer and use it in GitHub Desktop." aria-label="Save andremano/QGIS-Documentation to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>

                <a href="/andremano/QGIS-Documentation/archive/master.zip"
                   class="minibutton sidebar-button"
                   aria-label="Download the contents of andremano/QGIS-Documentation as a zip file"
                   title="Download the contents of andremano/QGIS-Documentation as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          

<a href="/andremano/QGIS-Documentation/blob/be3ee2714e655b718bb905a01237a1bf23e44057/source/docs/user_manual/introduction/general_tools.rst" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:12657d7a5de27fda43484dd88289d114 -->

<div class="file-navigation">
  
<div class="select-menu js-menu-container js-select-menu left">
  <span class="minibutton select-menu-button js-menu-target css-truncate" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    title="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/generaltools/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="generaltools"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="generaltools">generaltools</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/manual_en_v1.8/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="manual_en_v1.8"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="manual_en_v1.8">manual_en_v1.8</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/manual_en_v2.0/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="manual_en_v2.0"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="manual_en_v2.0">manual_en_v2.0</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/manual_en_v2.2/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="manual_en_v2.2"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="manual_en_v2.2">manual_en_v2.2</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/master/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/pre_rst/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="pre_rst"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="pre_rst">pre_rst</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/release_1.7/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="release_1.7"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="release_1.7">release_1.7</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/revert-244-master/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="revert-244-master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="revert-244-master">revert-244-master</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/smallfix/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="smallfix"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="smallfix">smallfix</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/blob/vectoroperations/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="vectoroperations"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="vectoroperations">vectoroperations</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <form accept-charset="UTF-8" action="/andremano/QGIS-Documentation/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ZA4ci7TJvpjCovgrQbEvekSJ8jX855jTZJxBup37Pv1fDL/s7BZgSpJlNn2pDQYBWYjDGgHRyXUlQm/wvm0gjA==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <h4>Create branch: <span class="js-new-item-name"></span></h4>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="source/docs/user_manual/introduction/general_tools.rst">
          </form> <!-- /.select-menu-item -->

      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/tree/pre-latex-removal/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="pre-latex-removal"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="pre-latex-removal">pre-latex-removal</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/andremano/QGIS-Documentation/tree/manual_1.8_en/source/docs/user_manual/introduction/general_tools.rst"
                 data-name="manual_1.8_en"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text css-truncate-target"
                 title="manual_1.8_en">manual_1.8_en</a>
            </div> <!-- /.select-menu-item -->
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="button-group right">
    <a href="/andremano/QGIS-Documentation/find/master"
          class="js-show-file-finder minibutton empty-icon tooltipped tooltipped-s"
          data-pjax
          data-hotkey="t"
          aria-label="Quickly jump between files">
      <span class="octicon octicon-list-unordered"></span>
    </a>
    <button class="js-zeroclipboard minibutton zeroclipboard-button"
          data-clipboard-text="source/docs/user_manual/introduction/general_tools.rst"
          aria-label="Copy to clipboard"
          data-copied-hint="Copied!">
      <span class="octicon octicon-clippy"></span>
    </button>
  </div>

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/andremano/QGIS-Documentation" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">QGIS-Documentation</span></a></span></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/andremano/QGIS-Documentation/tree/master/source" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">source</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/andremano/QGIS-Documentation/tree/master/source/docs" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">docs</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/andremano/QGIS-Documentation/tree/master/source/docs/user_manual" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">user_manual</span></a></span><span class="separator"> / </span><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/andremano/QGIS-Documentation/tree/master/source/docs/user_manual/introduction" class="" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">introduction</span></a></span><span class="separator"> / </span><strong class="final-path">general_tools.rst</strong>
  </div>
</div>


  <div class="commit file-history-tease">
    <div class="file-history-tease-header">
        <img alt="Alexandre Neto" class="avatar" data-user="3607161" height="24" src="https://avatars2.githubusercontent.com/u/3607161?v=2&amp;s=48" width="24" />
        <span class="author"><a href="/SrNetoChan" rel="contributor">SrNetoChan</a></span>
        <time datetime="2014-05-18T23:25:53Z" is="relative-time">May 19, 2014</time>
        <div class="commit-title">
            <a href="/andremano/QGIS-Documentation/commit/23011e4202fe44fc2873408d6b546d9fefe83a0f" class="message" data-pjax="true" title="Screenshots remove image size settings">Screenshots remove image size settings</a>
        </div>
    </div>

    <div class="participation">
      <p class="quickstat">
        <a href="#blob_contributors_box" rel="facebox">
          <strong>7</strong>
           contributors
        </a>
      </p>
          <a class="avatar-link tooltipped tooltipped-s" aria-label="junek" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=junek"><img alt="Larissa Junek" class="avatar" data-user="1647713" height="20" src="https://avatars2.githubusercontent.com/u/1647713?v=2&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="dassau" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=dassau"><img alt="Otto Dassau" class="avatar" data-user="778498" height="20" src="https://avatars0.githubusercontent.com/u/778498?v=2&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="SrNetoChan" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=SrNetoChan"><img alt="Alexandre Neto" class="avatar" data-user="3607161" height="20" src="https://avatars0.githubusercontent.com/u/3607161?v=2&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="alexbruy" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=alexbruy"><img alt="alexbruy" class="avatar" data-user="776954" height="20" src="https://avatars3.githubusercontent.com/u/776954?v=2&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="yjacolin" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=yjacolin"><img alt="Jacolin" class="avatar" data-user="660191" height="20" src="https://avatars1.githubusercontent.com/u/660191?v=2&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="rduivenvoorde" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=rduivenvoorde"><img alt="Richard Duivenvoorde" class="avatar" data-user="731673" height="20" src="https://avatars1.githubusercontent.com/u/731673?v=2&amp;s=40" width="20" /></a>
    <a class="avatar-link tooltipped tooltipped-s" aria-label="embelding" href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst?author=embelding"><img alt="embelding" class="avatar" data-user="7049228" height="20" src="https://avatars2.githubusercontent.com/u/7049228?v=2&amp;s=40" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="Larissa Junek" data-user="1647713" height="24" src="https://avatars0.githubusercontent.com/u/1647713?v=2&amp;s=48" width="24" />
            <a href="/junek">junek</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Otto Dassau" data-user="778498" height="24" src="https://avatars2.githubusercontent.com/u/778498?v=2&amp;s=48" width="24" />
            <a href="/dassau">dassau</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Alexandre Neto" data-user="3607161" height="24" src="https://avatars2.githubusercontent.com/u/3607161?v=2&amp;s=48" width="24" />
            <a href="/SrNetoChan">SrNetoChan</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="alexbruy" data-user="776954" height="24" src="https://avatars1.githubusercontent.com/u/776954?v=2&amp;s=48" width="24" />
            <a href="/alexbruy">alexbruy</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Jacolin" data-user="660191" height="24" src="https://avatars3.githubusercontent.com/u/660191?v=2&amp;s=48" width="24" />
            <a href="/yjacolin">yjacolin</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Richard Duivenvoorde" data-user="731673" height="24" src="https://avatars3.githubusercontent.com/u/731673?v=2&amp;s=48" width="24" />
            <a href="/rduivenvoorde">rduivenvoorde</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="embelding" data-user="7049228" height="24" src="https://avatars0.githubusercontent.com/u/7049228?v=2&amp;s=48" width="24" />
            <a href="/embelding">embelding</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
          <span>672 lines (471 sloc)</span>
          <span class="meta-divider"></span>
        <span>21.893 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
          <a href="/andremano/QGIS-Documentation/raw/master/source/docs/user_manual/introduction/general_tools.rst" class="minibutton " id="raw-url">Raw</a>
            <a href="/andremano/QGIS-Documentation/blame/master/source/docs/user_manual/introduction/general_tools.rst" class="minibutton js-update-url-with-hash">Blame</a>
          <a href="/andremano/QGIS-Documentation/commits/master/source/docs/user_manual/introduction/general_tools.rst" class="minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->

          <a class="octicon-button tooltipped tooltipped-nw"
             href="github-windows://openRepo/https://github.com/andremano/QGIS-Documentation?branch=master&amp;filepath=source%2Fdocs%2Fuser_manual%2Fintroduction%2Fgeneral_tools.rst" aria-label="Open this file in GitHub for Windows">
              <span class="octicon octicon-device-desktop"></span>
          </a>

              <a class="octicon-button js-update-url-with-hash"
                 href="/andremano/QGIS-Documentation/edit/master/source/docs/user_manual/introduction/general_tools.rst"
                 data-method="post" rel="nofollow" data-hotkey="e"><span class="octicon octicon-pencil"></span></a>

            <a class="octicon-button danger"
               href="/andremano/QGIS-Documentation/delete/master/source/docs/user_manual/introduction/general_tools.rst"
               data-method="post" data-test-id="delete-blob-file" rel="nofollow">
          <span class="octicon octicon-trashcan"></span>
        </a>
      </div><!-- /.actions -->
    </div>
      <div id="readme" class="blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="mainContentOfPage"><p><a href="#id133">|updatedisclaimer|</a></p>
<h2>
<a name="user-content-general-tools" class="anchor" href="#general-tools" aria-hidden="true"><span class="octicon octicon-link"></span></a>General Tools</h2>
<h3>
<a name="user-content-keyboard-shortcuts" class="anchor" href="#keyboard-shortcuts" aria-hidden="true"><span class="octicon octicon-link"></span></a>Keyboard shortcuts</h3>
<p><a href="#id135">|qg|</a> provides default keyboard shortcuts for many features. You can find them in
section <a href="#id2">:ref:`label_menubar`</a>. Additionally, the menu option
<a href="#id4">:menuselection:`Settings --&gt; Configure Shortcuts..`</a> allows you to change the default
keyboard shortcuts and to add new keyboard shortcuts to <a href="#id137">|qg|</a> features.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/shortcuts.png" target="_blank"><img alt="/static/user_manual/introduction/shortcuts.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/shortcuts.png" style="max-width:100%;"></a><p>Define shortcut options <a href="#id139">|nix|</a> (Gnome)</p>
</div>
<p>Configuration is very simple. Just select a feature from the list and click
on <strong>[Change]</strong>, <strong>[Set none]</strong> or <strong>[Set default]</strong>. Once you have finished your
configuration, you can save it as an XML file and load it to another <a href="#id141">|qg|</a>
installation.</p>
<h3>
<a name="user-content-context-help" class="anchor" href="#context-help" aria-hidden="true"><span class="octicon octicon-link"></span></a>Context help</h3>
<p>When you need help on a specific topic, you can access context help via the
<strong>[Help]</strong> button available in most dialogs --- please note that third-party
plugins can point to dedicated web pages.</p>
<h3>
<a name="user-content-rendering" class="anchor" href="#rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Rendering</h3>
<p>By default, <a href="#id143">|qg|</a> renders all visible layers whenever the map canvas is
refreshed. The events that trigger a refresh of the map canvas include:</p>
<ul>
<li>Adding a layer</li>
<li>Panning or zooming</li>
<li>Resizing the <a href="#id145">|qg|</a> window</li>
<li>Changing the visibility of a layer or layers</li>
</ul><p><a href="#id147">|qg|</a> allows you to control the rendering process in a number of ways.</p>
<h4>
<a name="user-content-scale-dependent-rendering" class="anchor" href="#scale-dependent-rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Scale Dependent Rendering</h4>
<p>Scale-dependent rendering allows you to specify the minimum and maximum scales
at which a layer will be visible. To set scale-dependent rendering, open the
<a href="#id7">:guilabel:`Properties`</a> dialog by double-clicking on the layer in the legend. On
the <a href="#id9">:guilabel:`General`</a> tab, click on the <a href="#id149">|checkbox|</a> <a href="#id11">:guilabel:`Scale
dependent visibility`</a> checkbox to activate the feature, then set the minimum and
maximum scale values.</p>
<p>You can determine the scale values by first zooming to the level you want to
use and noting the scale value in the <a href="#id151">|qg|</a> status bar.</p>
<h4>
<a name="user-content-controlling-map-rendering" class="anchor" href="#controlling-map-rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Controlling Map Rendering</h4>
<p>Map rendering can be controlled in the various ways, as described below.</p>
<h5>
<a name="user-content-suspending-rendering" class="anchor" href="#suspending-rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Suspending Rendering</h5>
<p>To suspend rendering, click the <a href="#id153">|checkbox|</a> <a href="#id13">:guilabel:`Render`</a> checkbox in the
lower right corner of the status bar. When the <a href="#id155">|checkbox|</a> <a href="#id15">:guilabel:`Render`</a>
checkbox is not checked, <a href="#id157">|qg|</a> does not redraw the canvas in response to any of
the events described in section <a href="#id17">:ref:`redraw_events`</a>. Examples of when you
might want to suspend rendering include:</p>
<ul>
<li>Adding many layers and symbolizing them prior to drawing</li>
<li>Adding one or more large layers and setting scale dependency before drawing</li>
<li>Adding one or more large layers and zooming to a specific view before drawing</li>
<li>Any combination of the above</li>
</ul><p>Checking the <a href="#id159">|checkbox|</a> <a href="#id19">:guilabel:`Render`</a> checkbox enables rendering and
causes an immediate refresh of the map canvas.</p>
<h5>
<a name="user-content-setting-layer-add-option" class="anchor" href="#setting-layer-add-option" aria-hidden="true"><span class="octicon octicon-link"></span></a>Setting Layer Add Option</h5>
<p>You can set an option to always load new layers without drawing them. This
means the layer will be added to the map, but its visibility checkbox in the
legend will be unchecked by default. To set this option, choose menu option
<a href="#id21">:menuselection:`Settings --&gt; Options`</a> and click on the <a href="#id23">:guilabel:`Rendering`</a>
tab. Uncheck the <a href="#id161">|checkbox|</a> <a href="#id25">:guilabel:`By default new layers added to the map
should be displayed`</a> checkbox. Any layer subsequently added to the map will be off
(invisible) by default.</p>
<h5>
<a name="user-content-stopping-rendering" class="anchor" href="#stopping-rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Stopping Rendering</h5>
<p>To stop the map drawing, press the <a href="#id27">:kbd:`ESC`</a> key. This will halt the refresh of
the map canvas and leave the map partially drawn. It may take a bit of time
between pressing <a href="#id29">:kbd:`ESC`</a> and the time the map drawing is halted.</p>
<div>
<p>Note</p>
<p>It is currently not possible to stop rendering --- this was disabled in the Qt4
port because of User Interface (UI) problems and crashes.</p>
</div>
<h5>
<a name="user-content-updating-the-map-display-during-rendering" class="anchor" href="#updating-the-map-display-during-rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Updating the Map Display During Rendering</h5>
<p>You can set an option to update the map display as features are drawn. By
default, <a href="#id163">|qg|</a> does not display any features for a layer until the entire layer
has been rendered. To update the display as features are read from the
datastore, choose menu option <a href="#id31">:menuselection:`Settings --&gt; Options`</a> and click on
the <a href="#id33">:guilabel:`Rendering`</a> tab. Set the feature count to an appropriate value to
update the display during rendering. Setting a value of 0 disables update
during drawing (this is the default). Setting a value too low will result in
poor performance, as the map canvas is continually updated during the reading of
the features. A suggested value to start with is 500.</p>
<h5>
<a name="user-content-influence-rendering-quality" class="anchor" href="#influence-rendering-quality" aria-hidden="true"><span class="octicon octicon-link"></span></a>Influence Rendering Quality</h5>
<p>To influence the rendering quality of the map, you have two options. Choose menu
option <a href="#id35">:menuselection:`Settings --&gt; Options`</a>, click on the <a href="#id37">:guilabel:`Rendering`</a>
tab and select or deselect following checkboxes:</p>
<ul>
<li>
<a href="#id165">|checkbox|</a> <a href="#id39">:guilabel:`Make lines appear less jagged at the expense of some
drawing performance`</a>
</li>
<li>
<a href="#id167">|checkbox|</a> <a href="#id41">:guilabel:`Fix problems with incorrectly filled polygons`</a>
</li>
</ul><h5>
<a name="user-content-speed-up-rendering" class="anchor" href="#speed-up-rendering" aria-hidden="true"><span class="octicon octicon-link"></span></a>Speed-up rendering</h5>
<p>There are two settings that allow you to improve rendering speed. Open the <a href="#id169">|qg|</a> options
dialog using <a href="#id43">:menuselection:`Settings --&gt; Options`</a>, go to the <a href="#id45">:guilabel:`Rendering`</a>
tab and select or deselect the following checkboxes:</p>
<ul>
<li>
<a href="#id171">|checkbox|</a> <a href="#id47">:guilabel:`Enable back buffer`</a>. This provides better graphics
performance at the cost of losing the possibility to cancel rendering and
incrementally draw features. If it is unchecked, you can set the
<a href="#id49">:guilabel:`Number of features to draw before updating the display`</a>, otherwise
this option is inactive.</li>
<li>
<a href="#id173">|checkbox|</a> <a href="#id51">:guilabel:`Use render caching where possible to speed up redraws`</a>
</li>
</ul><h3>
<a name="user-content-measuring" class="anchor" href="#measuring" aria-hidden="true"><span class="octicon octicon-link"></span></a>Measuring</h3>
<p>Measuring works within projected coordinate systems (e.g., UTM) and unprojected
data. If the loaded map is defined with a geographic coordinate system
(latitude/longitude), the results from line or area measurements will be
incorrect. To fix this, you need to set an appropriate map coordinate system
(see section <a href="#id53">:ref:`label_projections`</a>). All measuring modules also use the
snapping settings from the digitizing module. This is useful, if you want to
measure along lines or areas in vector layers.</p>
<p>To select a measuring tool, click on <a href="#id175">|mActionMeasure|</a> and select the tool you want
to use.</p>
<h4>
<a name="user-content-measure-length-areas-and-angles" class="anchor" href="#measure-length-areas-and-angles" aria-hidden="true"><span class="octicon octicon-link"></span></a>Measure length, areas and angles</h4>
<p><a href="#id177">|mActionMeasure|</a> <sup>Measure Line</sup>: <a href="#id179">|qg|</a> is able to measure real distances
between given points according to a defined ellipsoid. To configure this,
choose menu option <a href="#id55">:menuselection:`Settings --&gt; Options`</a>, click on the
<a href="#id57">:guilabel:`Map tools`</a> tab and select the appropriate ellipsoid. There, you can
also define a rubberband color and your preferred measurement units (meters or
feet) and angle units (degrees, radians and gon). The tool then allows you to
click points on the map. Each segment length, as well as the total, shows up in
the measure window. To stop measuring, click your right mouse button.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/measure_line.png" target="_blank"><img alt="/static/user_manual/introduction/measure_line.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/measure_line.png" style="max-width:100%;"></a><p>Measure Distance <a href="#id181">|nix|</a> (Gnome)</p>
</div>
<p><a href="#id183">|mActionMeasureArea|</a> <sup>Measure Area</sup>: Areas can also be measured. In the
measure window, the accumulated area size appears. In addition, the measuring
tool will snap to the currently selected layer, provided that layer has its
snapping tolerance set (see section <a href="#id59">:ref:`snapping_tolerance`</a>). So, if you want
to measure exactly along a line feature, or around a polygon feature, first set
its snapping tolerance, then select the layer. Now, when using the measuring
tools, each mouse click (within the tolerance setting) will snap to that layer.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/measure_area.png" target="_blank"><img alt="/static/user_manual/introduction/measure_area.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/measure_area.png" style="max-width:100%;"></a><p>Measure Area <a href="#id185">|nix|</a> (Gnome)</p>
</div>
<p><a href="#id187">|mActionMeasureAngle|</a> <sup>Measure Angle</sup>: You can also measure angles. The
cursor becomes cross-shaped. Click to draw the first segment of the angle you
wish to measure, then move the cursor to draw the desired angle. The measure
is displayed in a pop-up dialog.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/measure_angle.png" target="_blank"><img alt="/static/user_manual/introduction/measure_angle.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/measure_angle.png" style="max-width:100%;"></a><p>Measure Angle <a href="#id189">|nix|</a> (Gnome)</p>
</div>
<h4>
<a name="user-content-select-and-deselect-features" class="anchor" href="#select-and-deselect-features" aria-hidden="true"><span class="octicon octicon-link"></span></a>Select and deselect features</h4>
<p>The <a href="#id191">|qg|</a> toolbar provides several tools to select features in the map canvas.
To select one or several features, just click on <a href="#id193">|mActionSelect|</a> and select your
tool:</p>
<ul>
<li>
<a href="#id195">|mActionSelect|</a> <sup>Select Single Feature</sup>
</li>
<li>
<a href="#id197">|mActionSelectRectangle|</a> <sup>Select Features by Rectangle</sup>
</li>
<li>
<a href="#id199">|mActionSelectPolygon|</a> <sup>Select Features by Polygon</sup>
</li>
<li>
<a href="#id201">|mActionSelectFreehand|</a> <sup>Select Features by Freehand</sup>
</li>
<li>
<a href="#id203">|mActionSelectRadius|</a> <sup>Select Features by Radius</sup>
</li>
</ul><p>To deselect all selected features click on <a href="#id205">|mActionDeselectAll|</a> <sup>Deselect
features from all layers</sup>.</p>
<h3>
<a name="user-content-identify-features" class="anchor" href="#identify-features" aria-hidden="true"><span class="octicon octicon-link"></span></a>Identify features</h3>
<p>The Identify tool allows you to interact with the map canvas and get information on features
in a pop-up window. To identify features, use <a href="#id61">:menuselection:`View --&gt; Identify
features`</a> or press <a href="#id63">:kbd:`Ctrl + Shift + I`</a>, or click on the <a href="#id207">|mActionIdentify|</a>
<sup>Identify features</sup> icon in the toolbar.</p>
<p>If you click on several features, the <a href="#id65">:guilabel:`Identify results`</a> dialog will
list information about all the selected features. The first item is the number of the
feature in the list of results, followed by the layer name. Then, its first child will
be the name of a field with its value. Finally, all information about the feature
is displayed.</p>
<p>This window can be customized to display custom fields, but by default it will
display three kinds of information:</p>
<ul>
<li>Actions: Actions can be added to the identify feature windows. When clicking
on the action label, action will be run. By default, only one action is added,
to view feature form for editing.</li>
<li>Derived: This information is calculated or derived from other information.
You can find clicked coordinate, X and Y coordinates, area in map units and
perimeter in map units for polygons, length in map units for lines and feature
ids.</li>
<li>Data attributes: This is the list of attribute fields from the data.</li>
</ul><div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/identify_features.png" target="_blank"><img alt="/static/user_manual/introduction/identify_features.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/identify_features.png" style="max-width:100%;"></a><p>Identify feaures dialog <a href="#id209">|nix|</a> (Gnome)</p>
</div>
<p>At the bottom of the window, you have five icons:</p>
<ul>
<li>
<a href="#id211">|mActionIdentifyExpand|</a> <sup>Expand tree</sup>
</li>
<li>
<a href="#id213">|mActionIdentifyCollapse|</a> <sup>Collapse tree</sup>
</li>
<li>
<a href="#id215">|mActionIdentifyDefaultExpand|</a> <sup>Default behaviour</sup>
</li>
<li>
<a href="#id217">|mActionIdentifyCopyAttributes|</a> <sup>Copy attributes</sup>
</li>
<li>
<a href="#id219">|mActionIdentifyPrint|</a> <sup>Print selected HTML response</sup>
</li>
</ul><p>Other functions can be found in the context menu of the identified item. For
example, from the context menu you can:</p>
<ul>
<li>View the feature form</li>
<li>Zoom to feature</li>
<li>Copy feature: Copy all feature geometry and attributes</li>
<li>Copy attribute value: Copy only the value of the attribute that you click on</li>
<li>Copy feature attributes: Copy only attributes</li>
<li>Clear result: Remove results in the window</li>
<li>Clear highlights: Remove features highlighted on the map</li>
<li>Highlight all</li>
<li>Highlight layer</li>
<li>Activate layer: Choose a layer to be activated</li>
<li>Layer properties: Open layer properties window</li>
<li>Expand all</li>
<li>Collapse all</li>
</ul><h3>
<a name="user-content-decorations" class="anchor" href="#decorations" aria-hidden="true"><span class="octicon octicon-link"></span></a>Decorations</h3>
<p>The Decorations of <a href="#id221">|qg|</a> include the Grid, the Copyright Label, the North Arrow and
the Scale Bar. They are used to 'decorate' the map by adding cartographic
elements.</p>
<h4>
<a name="user-content-grid" class="anchor" href="#grid" aria-hidden="true"><span class="octicon octicon-link"></span></a>Grid</h4>
<p><a href="#id223">|transformed|</a> <sup>Grid</sup> allows you to add a coordinate grid and coordinate
annotations to the map canvas.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/grid_dialog.png" target="_blank"><img alt="/static/user_manual/introduction/grid_dialog.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/grid_dialog.png" style="max-width:100%;"></a><p>The Grid Dialog <a href="#id225">|nix|</a></p>
</div>
<ol>
<li>Select from menu <a href="#id68">:menuselection:`View --&gt; Decorations --&gt; Grid`</a>.
The dialog starts (see <a href="#figure-decorations-1">figure_decorations_1</a>).</li>
<li>Activate the <a href="#id227">|checkbox|</a> <a href="#id70">:guilabel:`Enable grid`</a> checkbox and set grid
definitions according to the layers loaded in the map canvas.</li>
<li>Activate the <a href="#id229">|checkbox|</a> <a href="#id72">:guilabel:`Draw annotations`</a> checkbox and set
annotation definitions according to the layers loaded in the map canvas.</li>
<li>Click <strong>[Apply]</strong> to verify that it looks as expected.</li>
<li>Click <strong>[OK]</strong> to close the dialog.</li>
</ol><h4>
<a name="user-content-copyright-label" class="anchor" href="#copyright-label" aria-hidden="true"><span class="octicon octicon-link"></span></a>Copyright Label</h4>
<p><a href="#id231">|copyright_label|</a> <sup>Copyright label</sup> adds a copyright label using the text
you prefer to the map.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/copyright.png" target="_blank"><img alt="/static/user_manual/introduction/copyright.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/copyright.png" style="max-width:100%;"></a><p>The Copyright Dialog <a href="#id233">|nix|</a></p>
</div>
<ol>
<li>Select from menu <a href="#id74">:menuselection:`View --&gt; Decorations --&gt; Copyright Label`</a>.
The dialog starts (see <a href="#figure-decorations-2">figure_decorations_2</a>).</li>
<li>Enter the text you want to place on the map. You can use HTML as
shown in the example.</li>
<li>Choose the placement of the label from the <a href="#id76">:guilabel:`Placement`</a>
<a href="#id235">|selectstring|</a> combo box.</li>
<li>Make sure the <a href="#id237">|checkbox|</a> <a href="#id78">:guilabel:`Enable Copyright Label`</a> checkbox is
checked.</li>
<li>Click <strong>[OK]</strong>.</li>
</ol><p>In the example above, which is the default, <a href="#id239">|qg|</a> places a copyright symbol followed by the
date in the lower right-hand corner of the map canvas.</p>
<h4>
<a name="user-content-north-arrow" class="anchor" href="#north-arrow" aria-hidden="true"><span class="octicon octicon-link"></span></a>North Arrow</h4>
<p><a href="#id241">|north_arrow|</a> <sup>North Arrow</sup> places a simple north arrow on the map canvas.
At present, there is only one style available. You can adjust the angle of the
arrow or let <a href="#id243">|qg|</a> set the direction automatically. If you choose to let <a href="#id245">|qg|</a>
determine the direction, it makes its best guess as to how the arrow should be
oriented. For placement of the arrow, you have four options, corresponding to
the four corners of the map canvas.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/north_arrow_dialog.png" target="_blank"><img alt="/static/user_manual/introduction/north_arrow_dialog.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/north_arrow_dialog.png" style="max-width:100%;"></a><p>The North Arrow Dialog <a href="#id247">|nix|</a></p>
</div>
<h4>
<a name="user-content-scale-bar" class="anchor" href="#scale-bar" aria-hidden="true"><span class="octicon octicon-link"></span></a>Scale Bar</h4>
<p><a href="#id249">|scale_bar|</a> <sup>Scale Bar</sup> adds a simple scale bar to the map canvas. You
can control the style and placement, as well as the labeling of the bar.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/scale_bar_dialog.png" target="_blank"><img alt="/static/user_manual/introduction/scale_bar_dialog.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/scale_bar_dialog.png" style="max-width:100%;"></a><p>The Scale Bar Dialog <a href="#id251">|nix|</a></p>
</div>
<p><a href="#id253">|qg|</a> only supports displaying the scale in the same units as your map frame.
So if the units of your layers are in meters, you can't create a scale bar in
feet. Likewise, if you are using decimal degrees, you can't create a scale
bar to display distance in meters.</p>
<p>To add a scale bar:</p>
<ol>
<li>Select from menu <a href="#id80">:menuselection:`View --&gt; Decorations --&gt; Scale Bar`</a>.
The dialog starts (see <a href="#figure-decorations-4">figure_decorations_4</a>).</li>
<li>Choose the placement from the <a href="#id82">:guilabel:`Placement`</a> <a href="#id255">|selectstring|</a> combo box.</li>
<li>Choose the style from the <a href="#id84">:guilabel:`Scale bar style`</a> <a href="#id257">|selectstring|</a>
combo box.</li>
<li>Select the color for the bar <a href="#id86">:guilabel:`Color of bar`</a> <a href="#id259">|selectcolor|</a> or use
the default black color.</li>
<li>Set the size of the bar and its label <a href="#id88">:guilabel:`Size of bar`</a> <a href="#id261">|selectnumber|</a>.</li>
<li>Make sure the <a href="#id263">|checkbox|</a> <a href="#id90">:guilabel:`Enable scale bar`</a> checkbox is checked.</li>
<li>Optionally, check <a href="#id265">|checkbox|</a> <a href="#id92">:guilabel:`Automatically snap to round number
on resize`</a>.</li>
<li>Click <strong>[OK]</strong>.</li>
</ol><div>
<p>Tip</p>
<p><strong>Settings of Decorations</strong></p>
<p>When you save a <a href="#id94">:file:`.qgs`</a> project, any changes you have made to Grid,
North Arrow, Scale Bar and Copyright will be saved in the project and restored
the next time you load the project.</p>
</div>
<h3>
<a name="user-content-annotation-tools" class="anchor" href="#annotation-tools" aria-hidden="true"><span class="octicon octicon-link"></span></a>Annotation Tools</h3>
<p>The <a href="#id267">|mActionTextAnnotation|</a> <sup>Text Annotation</sup> tool in the attribute
toolbar provides the possibility to place formatted text in a balloon on the
<a href="#id269">|qg|</a> map canvas. Use the <a href="#id96">:guilabel:`Text Annotation`</a> tool and click into the
map canvas.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/annotation.png" target="_blank"><img alt="/static/user_manual/introduction/annotation.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/annotation.png" style="max-width:100%;"></a><p>Annotation text dialog <a href="#id271">|nix|</a></p>
</div>
<p>Double clicking on the item opens a dialog with various options. There is the
text editor to enter the formatted text and other item settings. For instance, there
is the choice of having the item placed on a map position (displayed by
a marker symbol) or to have the item on a screen position (not related to the
map). The item can be moved by map position (by dragging the map marker) or by moving
only the balloon. The icons are part of the GIS theme, and they are used by default in
the other themes, too.</p>
<p>The <a href="#id273">|mActionAnnotation|</a> <sup>Move Annotation</sup> tool allows you to move the
annotation on the map canvas.</p>
<h4>
<a name="user-content-html-annotations" class="anchor" href="#html-annotations" aria-hidden="true"><span class="octicon octicon-link"></span></a>Html annotations</h4>
<p>The <a href="#id275">|mActionFormAnnotation|</a> <sup>Html Annotation</sup> tools in the attribute
toolbar provides the possibility to place the content of an html file in a
balloon on the <a href="#id277">|qg|</a> map canvas. Using the <a href="#id98">:guilabel:`Html Annotation`</a> tool, click
into the map canvas and add the path to the html file into the dialog.</p>
<h4>
<a name="user-content-svg-annotations" class="anchor" href="#svg-annotations" aria-hidden="true"><span class="octicon octicon-link"></span></a>SVG annotations</h4>
<p>The <a href="#id279">|mActionSaveAsSVG|</a> <sup>SVG Annotation</sup> tool in the attribute toolbar
provides the possibility to place an SVG symbol in a balloon on the <a href="#id281">|qg|</a> map
canvas. Using the <a href="#id100">:guilabel:`SVG Annotation`</a> tool, click into the map canvas and
add the path to the SVG file into the dialog.</p>
<h4>
<a name="user-content-form-annotations" class="anchor" href="#form-annotations" aria-hidden="true"><span class="octicon octicon-link"></span></a>Form annotations</h4>
<p>Additionally, you can also create your own annotation forms. The
<a href="#id283">|mActionFormAnnotation|</a> <sup>Form Annotation</sup> tool is useful to display
attributes of a vector layer in a customized Qt Designer form (see
<a href="#figure-custom-annotation">figure_custom_annotation</a>). This is similar to the designer forms for the
<a href="#id102">:guilabel:`Identify features`</a> tool, but displayed in an annotation item.
Also see this video <a href="https://www.youtube.com/watch?v=0pDBuSbQ02o">https://www.youtube.com/watch?v=0pDBuSbQ02o</a> from
Tim Sutton for more information.</p>
<div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/custom_annotation.png" target="_blank"><img alt="/static/user_manual/introduction/custom_annotation.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/custom_annotation.png" style="max-width:100%;"></a><p>Customized qt designer annotation form <a href="#id285">|nix|</a></p>
</div>
<div>
<p>Note</p>
<p>If you press <a href="#id104">:kbd:`Ctrl+T`</a> while an <a href="#id106">:guilabel:`Annotation`</a> tool is active
(move annotation, text annotation, form annotation), the visibility states
of the items are inverted.</p>
</div>
<h3>
<a name="user-content-spatial-bookmarks" class="anchor" href="#spatial-bookmarks" aria-hidden="true"><span class="octicon octicon-link"></span></a>Spatial Bookmarks</h3>
<p>Spatial Bookmarks allow you to "bookmark" a geographic location and return to
it later.</p>
<h4>
<a name="user-content-creating-a-bookmark" class="anchor" href="#creating-a-bookmark" aria-hidden="true"><span class="octicon octicon-link"></span></a>Creating a Bookmark</h4>
<p>To create a bookmark:</p>
<ol>
<li>Zoom or pan to the area of interest.</li>
<li>Select the menu option <a href="#id108">:menuselection:`View --&gt; New Bookmark`</a> or press
<a href="#id110">:kbd:`Ctrl-B`</a>.</li>
<li>Enter a descriptive name for the bookmark (up to 255 characters).</li>
<li>Press <a href="#id112">:kbd:`Enter`</a> to add the bookmark or <strong>[Delete]</strong> to remove the
bookmark.</li>
</ol><p>Note that you can have multiple bookmarks with the same name.</p>
<h4>
<a name="user-content-working-with-bookmarks" class="anchor" href="#working-with-bookmarks" aria-hidden="true"><span class="octicon octicon-link"></span></a>Working with Bookmarks</h4>
<p>To use or manage bookmarks, select the menu option
<a href="#id114">:menuselection:`View --&gt; Show Bookmarks`</a>. The <a href="#id116">:guilabel:`Geospatial Bookmarks`</a>
dialog allows you to zoom to or delete a bookmark. You cannot edit the bookmark
name or coordinates.</p>
<h4>
<a name="user-content-zooming-to-a-bookmark" class="anchor" href="#zooming-to-a-bookmark" aria-hidden="true"><span class="octicon octicon-link"></span></a>Zooming to a Bookmark</h4>
<p>From the <a href="#id118">:guilabel:`Geospatial Bookmarks`</a> dialog, select the desired bookmark
by clicking on it, then click <strong>[Zoom To]</strong>. You can also zoom to a bookmark by
double-clicking on it.</p>
<h4>
<a name="user-content-deleting-a-bookmark" class="anchor" href="#deleting-a-bookmark" aria-hidden="true"><span class="octicon octicon-link"></span></a>Deleting a Bookmark</h4>
<p>To delete a bookmark from the <a href="#id120">:guilabel:`Geospatial Bookmarks`</a> dialog, click on
it, then click <strong>[Delete]</strong>. Confirm your choice by clicking <strong>[Yes]</strong>, or cancel
the delete by clicking <strong>[No]</strong>.</p>
<h3>
<a name="user-content-nesting-projects" class="anchor" href="#nesting-projects" aria-hidden="true"><span class="octicon octicon-link"></span></a>Nesting Projects</h3>
<p>If you want to embed content from other project files into your project, you can
choose <a href="#id123">:menuselection:`Layer --&gt; Embed Layers and Groups`</a>.</p>
<h4>
<a name="user-content-embedding-layers" class="anchor" href="#embedding-layers" aria-hidden="true"><span class="octicon octicon-link"></span></a>Embedding layers</h4>
<p>The following dialog allows you to embed layers from other projects. Here is a
small example:</p>
<ol>
<li>Press <a href="#id287">|browsebutton|</a> to look for another project from the Alaska dataset.</li>
<li>Select the project file <a href="#id125">:file:`grassland`</a>. You can see the content of the
project (see <a href="#figure-embed-dialog">figure_embed_dialog</a>).</li>
<li>Press <a href="#id127">:kbd:`Ctrl`</a> and click on the layers <a href="#id129">:file:`grassland`</a> and
<a href="#id131">:file:`regions`</a>. Press <strong>[OK]</strong>. The selected layers are embedded in the map
legend and the map view now.</li>
</ol><div>
<a href="/andremano/QGIS-Documentation/blob/master/static/user_manual/introduction/embed_dialog.png" target="_blank"><img alt="/static/user_manual/introduction/embed_dialog.png" src="/andremano/QGIS-Documentation/raw/master/static/user_manual/introduction/embed_dialog.png" style="max-width:100%;"></a><p>Select layers and groups to embed <a href="#id289">|nix|</a></p>
</div>
<p>While the embedded layers are editable, you can't change their properties like
style and labeling.</p>
<h4>
<a name="user-content-removing-embedded-layers" class="anchor" href="#removing-embedded-layers" aria-hidden="true"><span class="octicon octicon-link"></span></a>Removing embedded layers</h4>
<p>Right-click on the embedded layer and choose <a href="#id291">|mActionRemoveLayer|</a> <sup>Remove</sup>.</p></article>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.04958s from github-fe136-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-suggester-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="fullscreen-contents js-fullscreen-contents js-suggester-field" placeholder=""></textarea>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-x flash-close js-ajax-error-dismiss" aria-label="Dismiss error"></a>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" src="https://assets-cdn.github.com/assets/frameworks-7697aacc55f84bd4542cfa34f8052d9a7e3d1378.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://assets-cdn.github.com/assets/github-86730ac1df5543b876a014a6824213397ee7e926.js" type="text/javascript"></script>
      
      
        <script async src="https://www.google-analytics.com/analytics.js"></script>
  </body>
</html>

