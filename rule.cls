% Document Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rule}
\LoadClass[10pt,twoside,titlepage]{article}

% Include
\RequirePackage{include/bhh}

% Layout
\usepackage[a5paper,includehead,margin=1.25cm]{geometry}
\RequirePackage{indentfirst}

% Spacing
\RequirePackage{enumitem}
\setlength{\columnsep}{1cm}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.25em}
\setlist{leftmargin=2em,font=\bfseries}

% Header
\RequirePackage{titleps}
\newpagestyle{main}{
  \sethead[\Large\FontTitleEn {\thepage} | {RULEBOOK}][][]
          {}{}{{\Large\FontTitleEn {RULEBOOK} | {\thepage}}}
}
\pagestyle{main}

% Background
\RequirePackage{background}
\RequirePackage{ifoddpage}
\backgroundsetup{
  scale=1,
  angle=0,
  opacity=.8,
  contents={
    \checkoddpage
    \ifoddpage
      \includegraphics[width=\paperwidth, height=\paperheight]{img/parchment_right.jpg}
    \else
      \includegraphics[width=\paperwidth, height=\paperheight]{img/parchment_left.jpg}
    \fi
  }
}

% Reference
\newcommand{\namepageref}[1]{p.\pageref{#1}『\nameref{#1}』章節}
\renewcommand{\thesubsection}{\thesection-\arabic{subsection}}

% Rule Box
\RequirePackage{framed}
\newenvironment{RuleBox}[1]{%
  \begin{framed}%
    \noindent{\large\textbf{#1}}\par%
}{%
  \end{framed}%
}
