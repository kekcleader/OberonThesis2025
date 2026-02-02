\LoadClass[11pt]{article}
% Nepieciešamās packages
\usepackage{graphicx, amsmath, amssymb, amsthm, amsfonts}
\usepackage{indentfirst}
\usepackage{float}
% Noformējums
	\linespread{0.85} %equals 1.5 spacing
	\newcommand{\@spacingsize}{0.85}
	\usepackage[a5paper, left=1.5cm, right=1.5cm, top=0.8cm, bottom=1.5cm, footskip=0.8cm, heightrounded]{geometry}

% Noformējums attēlu un tabulu anotācijām
\usepackage{booktabs}
\usepackage{caption}
\usepackage[numbers]{natbib}

\captionsetup[figure]{labelfont=it,textfont={bf},
	justification=centering,singlelinecheck=false}
\captionsetup[table]{labelfont=it,textfont={bf},justification=raggedleft,singlelinecheck=false,
	labelsep={newline}}

% PDF specifiskas iespējas
%\usepackage{hyperref} %Šai komandai jābūt pamatfailā, šeit nedrīkst būt! Punktus jauc!

% XeLaTeX specifiskas paketes
  \usepackage{xcolor}
	\usepackage{fontspec}
	\usepackage{xunicode}
	\usepackage{xltxtra} %

% Valodu atbalsts
	\usepackage{polyglossia}
	\setdefaultlanguage{russian}
	\setotherlanguages{english,latvian}

\color{gray!20!black}

\definecolor{roseRed}{rgb}{1.0, 0.0, 0.3}

\setmainfont[LetterSpace=4.5]{Literaturnaja}[
  Path = ./fonts/,
  ItalicFont = Literaturnaja-Italic.otf,
  UprightFont = Literaturnaja.otf,
  BoldFont = Literaturnaja-Bold.otf,
  BoldItalicFont = Literaturnaja-Italic.otf,
]

\newfontfamily\headingfont{Akademicheskaja}[
  Path = ./fonts/,
  Extension = .ttf,
  UprightFeatures = {RawFeature=+liga},
  LetterSpace = 5,
]

\usepackage{etoolbox}

\newcommand{\mainfontsetup}{%
	\linespread{0.85}\selectfont
	\fontsize{11pt}{11.2pt}\selectfont
}

\AtBeginDocument{\mainfontsetup}

\BeforeBeginEnvironment{english}{\mainfontsetup}
\AfterEndEnvironment{english}{\mainfontsetup}

% Fonti -- var rakstīt sistēmas fontu nosaukumus
%        \setmainfont[Mapping=tex-text, Language=Default]{Times New Roman}
%	\newfontfamily\russianfont{Times New Roman}
%	\setmainfont[Mapping=tex-text]{Literaturnaya}
%	\newfontfamily\russianfont{Literaturnaya}

% Speciālās nodaļas (t.i., bez numerācijas)
	\newcommand{\specnodala}[1]{\newpage\addcontentsline{toc}{section}{#1}\section*{#1}}

%Komanda, kuru ievietojot izveido atstarpi pirmajam nodaļas/sekcijas paragrāfam
\newcommand{\firstparskip}{\tiny {\color{white} skip }

\normalsize}

% Нумерация и формат заголовков
\renewcommand{\thesection}{\arabic{section}}
	\usepackage[explicit]{titlesec}

	\titleformat{name=\section,numberless}
	{\filcenter\large\bfseries}{}{-0.5em}{\MakeUppercase{#1}}

	\titleformat{\section}[display]
	{\filcenter\normalfont\large\bfseries\hyphenpenalty=10000}{Глава \thesection}{1em}{\hyphenpenalty=10000 \MakeUppercase{#1}}

	\titleformat{\subsection}
	{\normalfont\normalsize\bfseries}{\thesubsection.\quad}{-0.5em}{#1}

	\titleformat{\subsubsection}
	{\normalfont\normalsize}{\thesubsubsection.\quad}{-0.5em}{#1}

	\titleformat{\subsubsubsection}
	{\normalfont\normalsize\bfseries}{\thesubsubsubsection.\quad}{-0.5em}{#1}

% Увеличиваем промежуток перед главой
	\titlespacing*{\section}{0pt}{2.0cm}{0.7cm}

% Toc - Satura raditajs
\usepackage{tocloft}
\setlength{\cftbeforesecskip}{6pt}
% Переопределяем формат раздела в содержании на "Глава N"
\renewcommand{\cftsecpresnum}{Глава }
\renewcommand{\cftsecaftersnum}{.}
\setlength{\cftsecnumwidth}{5.6em}
% Добавляем точки-заполнители для section в содержании
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
% Увеличиваем отступ для подразделов в содержании
\setlength{\cftsubsecindent}{3.4em}
% Добавляем точку после номеров подразделов
\renewcommand{\cftsubsecaftersnum}{.}
% Увеличиваем отступ для подподразделов в содержании
\setlength{\cftsubsubsecindent}{3.4em}
% Добавляем точку после номеров подподразделов
\renewcommand{\cftsubsubsecaftersnum}{.}

% Literaturas saraksts

% Изменяем формат номеров в списке литературы с [14] на 14.
\renewcommand\@biblabel[1]{#1.}

\newcommand{\literatura}[1]{%
	\newpage\thispagestyle{empty}
	\renewcommand{\baselinestretch}{1}
	\bibliographystyle{unsrtnat}
	\renewcommand\refname{Список использованной литературы}
	\phantomsection\addcontentsline{toc}{section}{Список использованной литературы}\bibliography{#1}
	\renewcommand{\baselinestretch}{\@spacingsize}
}

% Vienādojumu numerācija
\numberwithin{equation}{section}

\renewcommand{\theequation}{\thesection.\arabic{equation}}

% Нумерация рисунков по главам (формат: глава-рисунок)
\renewcommand{\thefigure}{\thesection-\arabic{figure}}
\@addtoreset{figure}{section}
%Numurs pirms definīcijas, teorēmas (nevis aiz)
\swapnumbers
% Theorem tipa nosaukumi
\theoremstyle{definition}
	\newtheorem{definicija}{Определение}[section]
	\newtheorem{piezimed}{Piez\={\i}me}[section]
	\newtheorem{pienemums}{Pie\c{n}\={e}mums}[section]%
	\newtheorem{piemers}{Piem\={e}rs}[section]%
\theoremstyle{plain}
	\newtheorem{teorema}{Teor\={e}ma}[section]%
	\newtheorem{apgalvojums}{Оглавление}[section]%
	\newtheorem{lemma}{Lemma}[section]%
	\newtheorem{sekas}{Sekas}[section]%
	\newtheorem{piezime}{Piez\={\i}me}[section]
\renewcommand\proofname{Pier\={a}d\={\i}jums}
\newenvironment{pieradijums}{\begin{proof}}{\end{proof}}


%%% R koda noformējums
%Krāsu kodi

\newcommand{\ctext}[3][RGB]{%
  \begingroup
  \definecolor{hlcolor}{#1}{#2}\sethlcolor{hlcolor}%
  \hl{#3}%
  \endgroup
}

%Koda noformējums
\usepackage{soul}
\usepackage[dvipsnames,table,xcdraw]{xcolor}
\usepackage{listings} % R kodu noformejums
\lstset{
   language=R, basicstyle=\footnotesize, commentstyle=\ttfamily\color{green},
   numbers=left, numberstyle=\ttfamily\color{gray}\footnotesize, stepnumber=1,
   numbersep=5pt, backgroundcolor=\color{white}, showspaces=false, showstringspaces=false,
   showtabs=false, frame=single, tabsize=2, captionpos=b, breaklines=true,
   breakatwhitespace=false, title=\lstname, keywordstyle=\color{RoyalBlue},
   commentstyle=\color{Gray}, stringstyle=\color{ForestGreen} }

%%% Titlepage un  dokumentara lapa
	\newcommand{\autors}[1]{\author{#1}}
	\newcommand{\@nosaukumsLBset}{0}
	\newcommand{\@nosaukumsLB}{}
	\newcommand{\nosaukums}[1]{%
		\title{#1}
		\ifnum\@nosaukumsLBset=0
			\renewcommand{\@nosaukumsLB}{\MakeUppercase{#1}}
		\fi
	}
	\newcommand{\NOSAUKUMS}[1]{\renewcommand{\@nosaukumsLB}{#1}}
	\newcommand{\@gads}{}
	\newcommand{\gads}[1]{\date{#1}}
	%\newcommand{\gads}[1]{\renewcommand{\@gads}{#1}}
	\newcommand{\universityname}{Латвийский ордена Трудового Красного Знамени Государственный~Университет имени~Петра~Стучки}
	\newcommand{\universityshort}{ЛГУ}
	\newcommand{\@fakultate}{}
	\newcommand{\@fakultateD}{}
	\newcommand{\fakultate}[1]{%
		\renewcommand{\@fakultate}{#1}
		\renewcommand{\@fakultateD}{на факультете инженерно-технических наук}}
	\newcommand{\@katedra}{}
	\newcommand{\katedra}[1]{\renewcommand{\@katedra}{#1}}
	\newcommand{\@vieta}{}
	\newcommand{\vieta}[1]{\renewcommand{\@vieta}{#1}}
	\newcommand{\@darbaveids}{}
	\newcommand{\@darbaveidsLB}{0}
	\newcommand{\darbaveids}[1]{%
		\renewcommand{\@darbaveids}{#1}
		\if \@darbaveidsLB 0
			\renewcommand{\@darbaveidsLB}{\MakeUppercase{\@darbaveids}}
		\fi
	}
	\newcommand{\DARBAVEIDS}[1]{\renewcommand{\@darbaveidsLB}{#1}}
	\newcommand{\@studapl}{}
	\newcommand{\studapl}[1]{\renewcommand{\@studapl}{#1}}
	\newcommand{\@vaditajs}{}
	\newcommand{\vaditajs}[1]{\renewcommand{\@vaditajs}{#1}}
	\newcommand{\@recenzents}{}
	\newcommand{\recenzents}[1]{\renewcommand{\@recenzents}{#1}}
	\renewcommand{\maketitle}{%
		\renewcommand{\baselinestretch}{1}
	\begin{titlepage}%
		\vspace{5mm}
    {\centering\addfontfeature{LetterSpace=15.0}\MakeUppercase{\scriptsize \textbf{\universityname}}\par}%
		\vspace{-1.5mm}
    \noindent\rule{\linewidth}{1.2pt} \par%
		\vspace{4mm}
  {\raggedleft\scriptsize {На правах рукописи}\par}
	\begin{center}%
		\vspace{15mm}
    {\textbf{\@author} \par}%
		\vspace{20mm}
		{\large \setstretch{1.1} {\bfseries\@nosaukumsLB} \par}%
		\vspace{15mm}
  {\footnotesize {22.04.00\;—\;программное обеспечение вычислительной} \\
    {техники и~автоматизированных систем}\par}
		\vspace{25mm}
    {\MakeUppercase{\footnotesize \textbf{\@darbaveidsLB}} \par}%
	\end{center}\par
	\vspace*{\fill}%
  {\centering\scriptsize\textbf{\@vieta~---~\@date}\par}%
	\end{titlepage}%
	\global\let\and\relax
	\renewcommand{\baselinestretch}{\@spacingsize}\selectfont\normalsize
	\setcounter{page}{1}
	\renewcommand{\thepage}{\scriptsize\arabic{page}}
	\pagestyle{plain}
	}
	\newcommand{\@doklapa}{%
		\newpage\thispagestyle{empty}
		\renewcommand{\baselinestretch}{1}

		{\@darbaveids} \ «\@title» написана в \universityshort\ \@fakultateD.\par
		\vskip 2em%
    Настоящей подписью подтверждаю, что исследование выполнено самостоятельно, с использованием только указанных в нём источников информации, а электронная копия представленной работы соответствует печатному экземпляру.\par
		\vskip 2em
		Автор: \@author\par
		\vskip 2em
		\hspace{4em}\begin{tabular}{cc}%
			\underline{\hspace{10em}}\vspace{-2mm} &
			\underline{\hspace{8em}} \\
			\tiny{(подпись)} &
			\tiny{(число)}
		\end{tabular}
		\vskip 4em%
		Рекомендую работу к защите:\par
		Научный руководитель: \@vaditajs\par
		\vskip 2em
		\hspace{4em}\begin{tabular}{cc}%
			\underline{\hspace{10em}}\vspace{-2mm} &
			\underline{\hspace{8em}} \\
			\tiny{(подпись)} &
			\tiny{(число)}
		\end{tabular}
		\vskip 4em%
		Рецензент: \@recenzents \par
		\vskip 4em
		\hspace{4	em}\begin{tabular}{cc}%
			\underline{\hspace{10em}}\vspace{-2mm} &
			\underline{\hspace{8em}} \\
			\tiny{(подпись)} &
			\tiny{(число)}
		\end{tabular}

		\vskip 2em%
		\begin{tabular}{lc}
    Работа представлена на кафедру математики 26 июня 2025 года. \\
		\end{tabular}\par
		\vskip 3em
		\begin{tabular}{c}%
			\underline{\hspace{25em}}\vspace{-2mm} \\
			\tiny{(уполномоченное лицо декана: старший методист Инита Шнейдер)}
		\end{tabular}
		\vskip 3em%
    Работа защищена на заседании Государственной экзаменационной комиссии по защите дипломных работ.\par
		\vskip 1em%
		26 июня 2025 года.
	}

	% \AtEndDocument{\@doklapa}

%\usepackage{fixlatvian}
