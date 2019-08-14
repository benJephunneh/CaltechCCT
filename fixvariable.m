% function fixvariable ( var2fix )
%FIXVARIABLE Clears an empty variable, or a variable that is not a cell and
%            not struct and a NaN.
%
%   Example:
%       FIXVARIABLE(fixvar)

% Modified to be a function: 8 Aug 19 (CPM)
% var2fix = eval('var2fix')
% evalin('base', var2fix)
% sprintf('%s', var2fix)
% eval('exist(''var2fix'')')
% eval('~isnan(''var2fix'')')
% eval('isempty(''var2fix'')')
% evalin('base', ['isempty(' var2fix ')'])
% evalin('base', ['exist(' var2fix ')'])
% eval('exist(''var2fix'')')

% if evalin('base', 'exist(''var2fix'', ''var'')')
% if evalin('base', 'var2fix'))
%     disp([var2fix ' exists'])
%     if eval(['isempty(' var2fix ', ''var'')'])
% %     if evalin('base', ['isempty(' var2fix ')'])
%         disp([var2fix ' is empty'])
%         eval('clear var2fix')
% %         evalin('base', ['clear ' var2fix])
%     elseif (evalin('base', ['~isstruct(' var2fix ')']) && ...
%             evalin('base', ['~iscell(' var2fix ')']) && ...
%             evalin('base', ['isnan(' var2fix ')']))
%         disp([var2fix ' is not a struct, not a cell, and a NaN'])
%         evalin('base', ['clear ' var2fix])
%     end
% end

if exist('var2fix', 'var')
    if exist(var2fix, 'var') % if eval(['exist(''' var2fix ''') == 1']),
        if isempty(var2fix) % if eval(['isempty(' var2fix ')']),
            clear var2fix % eval(['clear ' var2fix ]);
        else
            if ~isstruct(var2fix) % if eval(['~isstruct(' var2fix ')']),
                if ~iscell(var2fix) % if eval(['~iscell(' var2fix ')']),
                    if isnan(var2fix) % if eval(['isnan(' var2fix '(1))']),
                        clear var2fix % eval(['clear ' var2fix ]);
                    end
                end
            end
        end
    end
end

% end