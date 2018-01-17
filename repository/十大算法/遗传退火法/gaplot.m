function state = gaplot(FitnessFcn,options,state,flag)
%GAPLOT Helper function that manages the display functions.
%   STATE = GAPLOT(FitnessFcn, options, state, flag) runs each of the graph
%   functions in the options.GraphFcns cell array.
%
%   This function is private to GA and is called between each generation.

%   Copyright 2003-2004 The MathWorks, Inc. 
%   $Revision: 1.11.4.3 $  $Date: 2004/08/20 19:49:09 $

persistent plotNo plotNames isNew fig position

if (rem(state.Generation,options.PlotInterval) ~=0)
    return;
end
functions = options.PlotFcns;
fname = 'Genetic Algorithm';
if (isempty(functions)) || (strcmpi(flag,'done') ...
    && isempty(findobj(0,'Type','figure','name',fname)))
    return;
end
functions = removeDup(functions);
args = options.PlotFcnsArgs;

%Called with 'init' flag or the figure is not present
if(strcmp(flag,'init')) || isempty(findobj(0,'Type','figure','name',fname))
    fig = findobj(0,'type','figure','name',fname);
    if isempty(fig)
        fig = figure('visible','off');
        if ~isempty(position) && ~strcmpi(get(fig,'WindowStyle'),'docked')
            set(fig,'Position',position);
        end
    end
    set(0,'CurrentFigure',fig);
    clf;
    set(fig,'DoubleBuffer','on','numbertitle','off','name',fname, ...
        'userdata',[],'DockControls','off','Renderer','painters');
    %Initialize the persistent variables
    plotNo = []; plotNames = [];isNew = []; 
    [plotNames, args, plotNo, isNew] = updatelist(plotNames, plotNo, ...
        functions, args, fig, 'init');
   
    %Give a stop button in the figure
    uicontrol('string','stop','Position',[10 10 40 30],'callback',@buttonStop);
    shg
end
set(0,'CurrentFigure',fig);
set(fig,'CloseRequestFcn',@beforeClose);
%determine the layout size in the figure
rows  = ceil(sqrt(length(functions)));
cols  = ceil(length(functions)/rows);


if change_runtime(functions,plotNames)
    [plotNames, args, plotNo, isNew] = updatelist(plotNames, plotNo, ...
        functions, args, fig, '');
end

if all(isNew)
    mouseaction([],[],[],'init');
end
% call each plot function
for i = 1:length(plotNames)
    handle = subplot(rows,cols,plotNo(i));
    if isNew(i)
        set(handle,'ButtonDownFcn',{@mouseaction,plotNames{i},'add'});
        %Do not delete the axis (which is the default settings)
        set(handle,'NextPlot','replacechildren');
        state = feval(plotNames{i},options,state,'init',args{i}{:});
         isNew(i)=false;
        %If in the middle of itertions, call with the regular 'flag' too.
        if ~strcmpi(flag,'init')
            state = feval(plotNames{i},options,state,flag,args{i}{:});
        end
    else
           state = feval(plotNames{i},options,state,flag,args{i}{:});
      end
end

state = gaplotagain(FitnessFcn,plotNames,args,options,state,flag);

drawnow
%Check if the figure is still alive
if isempty(findobj(0,'Type','figure','name',fname))
    state.StopFlag = 'stop requested.';
    return;
end
%Remember the position
position = get(fig,'Position');
%If any button was pressed, handle that
set(fig,'CloseRequestFcn','closereq');
if(strcmpi('stop',getappdata(fig,'data')))
    state.StopFlag = 'stop requested.';
    setappdata(fig,'data','')
    return;
end

%-------------------------------------------------------
%UPDATELIST updates the function list and plot numbers
%-------------------------------------------------------
function [plotNames, fcnArgs, plotNo, isNew] = updatelist(plotNames,plotNo,functions,args,fig,flag)

if strcmpi(flag,'init')
    plotNames = functions;
    plotNo   = 1:length(functions);
    isNew = true(length(plotNames),1);
    fcnArgs = args;
    return;
end

%determine the layout size in the figure
rows = ceil(sqrt(length(functions)));
cols = ceil(length(functions)/rows);
%what was the layout size before
rows1 = ceil(sqrt(length(plotNames)));
cols1 = ceil(length(plotNames)/rows1);

set(0,'CurrentFigure',fig);
fcnArgs = cell(1,length(plotNames));
isNew = false(length(plotNames),1);
to_delete = false(length(plotNames),1);
%Check if any of plotNames is not in functions;remove such entries
for i = 1:length(plotNames)
    [found, index] = foundfunc(plotNames{i},functions);
    if ~found
        delete_this = subplot(rows1,cols1,plotNo(i));
        delete(delete_this);
        to_delete(i) = true;
    else
        fcnArgs(i) = args(index(1));   
    end
end
%delete the plot names which are not in functions
plotNames(to_delete) = []; plotNo(to_delete) = []; 
isNew(to_delete) = []; fcnArgs(to_delete) = [];

%Now, add all new entries of functions in plotNames
for i = 1:length(functions)
    found = foundfunc(functions{i},plotNames);
    if ~found
        plotNames(end+1) = functions(i);
        fcnArgs(end+1) = args(i);
        isNew(end+1) = true;
        plotNo(end+1) = 0; 
    end
end

%Determine the plot numbers
if rows1 == rows && cols1 == cols
    %Binary search and replacement
    for i = 1:length(plotNames)
        if plotNo(i) == 0 
            for j = 1:rows*cols
                if ~any(j == plotNo)
                    plotNo(i) = j;
                end
            end
        end
    end
elseif rows1 > rows || cols1 > cols
    %find position of all existing axes and shift them
    for i = length(plotNames):-1:1
        if plotNo(i) ~=0
            subplot(rows1,cols1,plotNo(i))
            %plotNo(i) = i;
        else
            plotNo(i) = i;
            subplot(rows1,cols1,plotNo(i))
        end
        plotNo(i) = i;
        subplot(rows,cols,plotNo(i),gca);
        
    end
elseif rows1 < rows || cols1 < cols
    for i = 1:length(plotNames)
        if plotNo(i) ~=0
            subplot(rows1,cols1,plotNo(i))
            %plotNo(i) = i;
        else
            plotNo(i) = i;
            subplot(rows,cols,plotNo(i))
        end
        subplot(rows,cols,plotNo(i),gca);
    end
    
end

%-----------------------------------------------------------
%CHANGE_RUNTIME return a boolean if two cell arrays are same or not
%-----------------------------------------------------------
function bool = change_runtime(functions,plotNames)
bool = false;    
    for i = 1:length(functions)
        if ~foundfunc(functions{i},plotNames)
            bool = true;
        end
    end
    
    for i = 1:length(plotNames)
        if ~foundfunc(plotNames{i},functions)
            bool = true;
        end
    end

%-----------------------------------------------------------
%REMOVEDUP remove the duplicate entries in a cell array of function handle
%-----------------------------------------------------------
function functions = removeDup(functions)
i = 1;
while i <= length(functions)
      [found,index] = foundfunc(functions{i},functions);
      if found 
        functions(index(1:end-1)) = [];
    end
    i = i+1;
end

%-------------------------------------------------------------------------
%FOUNDFUNC Finds if STR is in FUNCNAMES, returns a boolean and index
%-------------------------------------------------------------------------
function [bool,index] = foundfunc(str,funcNames)

bool = false;
index = 0;
for i = 1:length(funcNames)
    if strcmpi(func2str(str),func2str(funcNames{i}))
        bool = true;
        if nargout > 1
            index(end+1) = i;
        end
    end
end
index(1) = [];
%-----------------------------------------------------------
%BUTTONSTOP callback for uibutton 'stop'
%-----------------------------------------------------------
function buttonStop(unused,unused2)
setappdata(gcf,'data','stop');

%-----------------------------------------------------------
%BUTTONDOWNACTION maintain a list of all the plot whose ButtondownFcn 
%callback or DeleteFcn is executed.
%-----------------------------------------------------------
function [done, func] = mouseaction(obj,eventdata,Name,what)

persistent list
done = false;
func = [];
switch lower(what)
    case 'length'
        if ~isempty(list)
            done = true;
        else 
            done = false;
        end
    case 'init'
        list = [];
        done = true;
    case 'add'
        if isempty(list)
            list{1} = Name;
        elseif ~foundfunc(Name,list);
            list{end+1} = Name;
            done = true;
        end
        fig = findobj(0,'type','figure','name',value2RHS(Name));
        if ~isempty(fig)
            close(fig);
        end
    case 'remove'
        if ~isempty(list)
          [found,index] = foundfunc(Name,list);
            if found
                list(index) = [];
                done = true;
            end
        end
end
func = list;

%-----------------------------------------------------------
%GAPLOTAGAIN plots all the functions whose ButtondownFcn has been
%called.
%-----------------------------------------------------------
function state = gaplotagain(FitnessFcn,plotNames,args,options,state,flag)

[foundAny, func] = mouseaction([],[],[],'length');
if ~foundAny
    return;
else
    to_delete = false(1,length(func));
    fcnArgs = cell(1,length(func));
    for i = 1:length(func)
        [found, index] = foundfunc(func{i},plotNames);
        if ~found
            to_delete(i) = true;
        else
            fcnArgs(i) = args(index(1));
        end
    end
    %delete the plot names which are not in functions
    func(to_delete) = [];  fcnArgs(to_delete) = [];
end

% call each plot function
for i = 1:length(func)
    fname = value2RHS(func{i});
    fig = findobj(0,'type','figure','name',fname);
    %Called with 'init' flag or the figure is not present
    if isempty(fig)
        fig = figure;
        set(fig,'DoubleBuffer','on','numbertitle','off','name',fname, ...
            'userdata',[],'Renderer','painters');
        handle = figure(fig);
        set(gca,'NextPlot','replacechildren');
        state = feval(func{i},options,state,'init');
        set(handle,'DeleteFcn',{@mouseaction,plotNames{i},'remove'});
    end
    set(0,'CurrentFigure',fig);
    state = feval(func{i},options,state,flag,fcnArgs{i}{:});
    set(gcf,'DeleteFcn',{@mouseaction,func{i},'remove'});
end

%-----------------------------------------------------------
%BEFORECLOSE CloseRequestFcn for main figure window
%-----------------------------------------------------------
function beforeClose(obj,event)

msg = sprintf('%s\n%s','YES will stop the solver (if running) and close the figure.',...
                           'NO will cancel this request.');
handle = questdlg(msg,'Close dialog', 'YES','NO','NO');
switch handle
    case 'YES'
        delete(obj)
    case 'NO' 
        return;
    otherwise
        return;
end
%-------------------------------------------------------------------------


