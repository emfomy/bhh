% Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{haunt}
\LoadClass[10pt,a4paper,twocolumn]{report}

% Include
\RequirePackage{include/bhh}

% Layout
\usepackage[a4paper,includeheadfoot,margin=1.25cm]{geometry}
\RequirePackage{indentfirst}
\setcounter{tocdepth}{1}

% Spacing
\RequirePackage{enumitem}
\setlength{\columnsep}{1cm}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.25em}
\setlist{leftmargin=1em,font=\bfseries}

% Title
\RequirePackage{titlesec}
\titlespacing{\chapter}{0pt}{0em}{4em}
\titleformat{\chapter}[hang]
{\centering\normalfont\huge\bfseries}{Haunt\ \thechapter}{1em}{}

% Haunt Story
\newenvironment{HauntStory}{%
  % \setlength{\parindent}{0em}%
  \FontStory%
}{%
}

% Haunt Section
\newcommand{\HauntSection}[1]{\bigbreak\noindent\textbf{\Large#1}\smallbreak}
