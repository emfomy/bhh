% Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{haunt}
\LoadClass[11pt,a4paper,twocolumn]{report}

% Include
\RequirePackage{include/bhh}

% Layout
\RequirePackage[a4paper,margin=1.25cm]{geometry}
\RequirePackage{indentfirst}
\setcounter{tocdepth}{1}

% Spacing
\RequirePackage{enumitem}
\setlength{\columnsep}{1cm}
\setlength{\parindent}{0em}
\setlength{\parskip}{0.25em}
\setlist{leftmargin=1em,font=\bfseries}

% Title
\RequirePackage[explicit]{titlesec}
\titlespacing{\chapter}{0pt}{0pt}{2em}
\titleformat{\chapter}[block]{%
  \centering\Huge\bfseries%
}{}{0pt}{%
  \thechapter\hfill#1\hfill\thechapter%
}

% Table
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{makecell}
\newcommand{\RoomT}[1]{\makecell{%
  \bfseries \ref{room:#1}{} \\[-.5ex]%
  \bfseries\small #1%
}}
\newcommand{\OmenT}[1]{\makecell{%
\bfseries \ref{omen:#1}{} \\[-.5ex]%
\bfseries\small #1%
}}

% Haunt Story
\newenvironment{HauntStory}{%
  % \setlength{\parindent}{0em}%
  \FontStory%
}{%
}

% Haunt Section
\makeatletter
\newcommand\cdotfill{%
  \leavevmode\cleaders\hb@xt@.44em{\hss$·$\hss}\hfill\kern\z@%
}
\makeatother

\newcommand{\HauntSection}[1]{\bigbreak\noindent{\bfseries\Large#1}\smallbreak}

\newcommand{\HauntMobStatusSection}[1]{\bigbreak\noindent{\bfseries\LARGE※\cdotfill#1\cdotfill※}\null\smallbreak}
\newcommand{\HauntMobStatus}[1]{\noindent{\bfseries\hfill\large#1\hfill}\null\smallbreak}
