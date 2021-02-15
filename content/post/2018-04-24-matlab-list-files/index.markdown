---
title: "Matlab list_files"
author: "Matias Andina"
date: 2018-04-24
output: html_document
tags: ["learning", "ideas", "R", "Matlab"]
---

For many purposes, I find myself in need of a Graphical User Interface (GUI). Thus, I experienced a forceful transition to Matlab. Let's be honest, Matlab can do powerful things, it's a great language to attempt to dominate (note to self: learn python!). However, I find myself over and over thinking in `R` mode. Something along the lines of:

> Gimme all the files in...

Will be easily accomplished in `R`


```r
list.files(...)
```

This command can handle many many options, with `pattern` being among my favorite. More importantly, this command returns a useful `character` vector. No extra dots, no list of lists, no array. Just, useful. On the other hand, Matlab has `dir` and `ls` both of which are not satisfactory.   


```octave
dir

.                                                      
..                                    
something.m                            
something_else.m                               
LookHere.m

```

Yes...Matlab's version can also handle some form of regular expression matching. But, mind the dots and the structure! Matlab's `dir` has a ton of things on it.  


```octave
>> q = dir

q = 

  20×1 struct array with fields:

    name
    folder
    date
    bytes
    isdir
    datenum
```

Matlab `ls` function is also full of deadly traps.  


```octave
qq = ls

qq =

  20×28 char array

    '.                           '
    '..                          '
    'many_things_here.ext        '

```


## The solution

I found myself fighting for a character vector or array (`nx1`) I can feed into a function/loop/whatever.  

So after many many many times fighting against classes, with functions that expect `char` instead of `string`, or `cell`, or `whatever`, I decided to create something that resembles (at least partially) the functionality I was looking for. It's not perfect, in fact, please enlighten me with a better approach. For now, I will be using `list_files.m`. Wanna use it? Be my guest, see below:


```octave

% The idea of this function is to have something that works to list files
% Matlab has too many weird things with dir/patterns/etc...
% It could be slow if calling in a BIG dir and then subsetting
% Otherwise it should work pretty fast

function filenames = list_files(varargin)

% Open input parser
p = inputParser();

% Add possible values
addOptional(p, 'Interactive', true, @islogical)
addOptional(p, 'Dirname', '0', @ischar)
addOptional(p, 'Pattern', {'.'}, @iscell)
addOptional(p, 'FullPath', false, @islogical)


% parse
parse(p, varargin{:});

% retrieve things from parser
Interactive = p.Results.Interactive;
Dirname = p.Results.Dirname;
Pattern = p.Results.Pattern;
FullPath = p.Results.FullPath;


%% Dirname goes first
% If we didn't provide a Dirname, both defaults will hold
% If we provided a Dirname, we will read from there

if (Interactive && string(Dirname) == '0')

    dirname = uigetdir();

else
    
    dirname = Dirname;
    
end


if ~isdir(dirname)
    error('Dirname not valid, check dirname provided is character and exists.')
end

% actually call dir
    d=dir(dirname);
% Remove the dots matlab puts to things
    d=d(~ismember({d.name},{'.','..'}));

    % Get filenames
    % Output as an mx1 cell
    
    filenames = {d.name}';

        
%% Subset by pattern
    
    default_pattern = string(Pattern) == '.';

    if (~default_pattern) % non default case
    
    % join cell patterns separated by the 'or' regular expression
    query_expression = strjoin(Pattern, '|');
    
    %  Subset the patterns
    filenames = filenames(~cellfun(@isempty,regexp(filenames, query_expression)));
    end
    
    % By default we return just the name
    % If you want the full path, call it!
    % it currently works only for 1 folder
    % Recursive = TRUE will be super nice!
    
    if FullPath
    filenames = fullfile(unique({d.folder}), filenames);
    end
end

```

