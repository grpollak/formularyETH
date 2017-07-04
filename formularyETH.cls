% ==============================================================================
% Copyright (c) 2017 [Georg R. Pollak]  
% ==============================================================================
% ------------------------------------------------------------------------------

  % Permission is hereby granted, free of charge, to any person obtaining a copy
  % of this software and associated documentation files (the "Software"), to deal
  % in the Software without restriction, including without limitation the rights
  % to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  % copies of the Software, and to permit persons to whom the Software is
  % furnished to do so, subject to the following conditions:

  % The above copyright notice, the creator of the formuary package G.R. Pollak
  % and this permission notice shall be included in all copies or substantial portions of the Software.

% ==============================================================================
% End
% ==============================================================================
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{formularyETH/formularyETH}[2016/10/11]

\RequirePackage{formularyETH/formularyETH_variables}
% ======================================================================
% More Controll statements, optional arguments
\RequirePackage{xargs} 
\usepackage{xstring}
% ======================================================================
% Options
% ======================================================================

% Number of columns per page 
% ----------------------------------------------------------------------
	\DeclareOption{twoColumns}{\setcounter{numberOfColumns}{2}}
	\DeclareOption{threeColumns}{\setcounter{numberOfColumns}{3}}
	\DeclareOption{fourColumns}{\setcounter{numberOfColumns}{4}}
	\DeclareOption{fiveColumns}{\setcounter{numberOfColumns}{5}}
% Defaults
% 	\PassOptionsToClass{<options-list>} {<class-name>}:
%  	used to automatically invoke the corresponding options when the 
%	class is loaded.
%	\DeclareOption{<option>}{<code>}
% ----------------------------------------------------------------------
	
	\PassOptionsToClass{fontsize=\mainFontSize,\DIN,\paperOrientation}{\baseClass}

%  Define the \theLanguage variable according to the chose option
% ----------------------------------------------------------------------
	\DeclareOption{german}{\def\theLanguage{ngerman}}
	\DeclareOption{english}{\def\theLanguage{english}}

% Default fallback option, gets called in case of not defined options  
% ----------------------------------------------------------------------
	\DeclareOption*{%
		\PassOptionsToClass{\CurrentOption}{\baseclass}%
	}

% Terminate/Process options process
% ----------------------------------------------------------------------
	\ProcessOptions\relax

	% Load baseclass
	\LoadClass{\baseClass}


% ======================================================================
% Packages
% ======================================================================
	% load formularyETH packages
	%\RequirePackage{formularyETH/scientific}  			% scientific macros for LaTeX4EI
	\RequirePackage{formularyETH/formularyETH}			% Basic style definitions
	\RequirePackage{formularyETH/formularyETH_colors}	% Colors
	\RequirePackage{formularyETH/formularyETH_macros}	% Further macros
	\RequirePackage{formularyETH/formularyETH_boxes}	% section boxes
	\RequirePackage[utf8]{inputenc}	
	\RequirePackage{makeidx}							% Create an index
	\RequirePackage[super]{nth} 						% Allows to write \nth{1}, \nth{2},... for nicer formatting 
	\RequirePackage{xparse}								% Allow multiple default arguments
	%\DeclareDocumentCommand{\foocmd}{ O{default1} O{default2} m }{#1~#2~#3}
	%\foocmd[nondefault1]{foo}
	%\foocmd[nondefault2][nondefault1]{foo}
	\RequirePackage{import}								% Allows to specify import paths
	   	                    								% 
% ======================================================================
% Layout
% ======================================================================

% Geometry
% ----------------------------------------------------------------------
	\RequirePackage{geometry}
	\geometry{\DIN,
			  \paperOrientation, 
			  top=\TPaperMargin, 
			  left=\leftPaperMargin,
			  right=\rigthPaperMargin,
			  bottom=\bottomPaperMargin
	}%,includefoot, footskip=1.7em}

% Multicolumn
% ----------------------------------------------------------------------
	\RequirePackage{multicol}			% for columns

	% start multicolumn
	\AtBeginDocument{
	    \begin{multicols*}{\value{numberOfColumns}}
	}
	% Makes sure that columns are flusht to top other wise big spaces
	\raggedcolumns
	\AtEndDocument{
		\label{LastPage}
		\end{multicols*}
	}
	\setlength\columnsep{\columnsepperation}
% ======================================================================
% Basic Settings
% ======================================================================

% Identify Compiler
% ----------------------------------------------------------------------
	\RequirePackage{ifxetex}

	% Check if document is being processed/compiled with XeTex
	\ifxetex%
		
		%XeLaTeX
		\PassOptionsToPackage{no-math}{fontspec}
	    \RequirePackage{xltxtra}
	    \defaultfontfeatures{Scale=MatchLowercase,Mapping=tex-text}
		
		% for unicode decalarations
		%\let\DeclareUnicodeCharacter\newunicodechar
		\setmainfont{Times New Roman}
		\setromanfont{Times New Roman}
		\setsansfont{Helvetica}
		
	\else
		% pdfLaTeX  
	    \RequirePackage[utf8]{inputenc}		% UTF-8 input 
	    %\RequirePackage{latex4ei/latex4ei_unicode}	% UTF-8 input of math symbols
	    %\InputIfFileExists{glyphtounicode}{\pdfgentounicode=1}{}	% Glyph-to-Unicode Translation (needs PdfTex >=1.4)
		%\RequirePackage{textcomp}				% get rid of font warnings
		%\pdfminorversion=6						% for 3D Objects
		%\RequirePackage[osf]{mathpazo}			% old style numbering
	\fi

