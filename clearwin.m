function clearwin()
%CLEARWIN Clears all wintx.i and winty.i
%   In normal operation of the toolbox, this function should not be
%   useful, except in cases where you want to re-extract corners using the
%   'Extract grid corners' another time... not common.  You might as well
%   use the Recomp. corners.

if (exist('n_ima', 'var') && ~isempty(n_ima))
    for ii = 1:n_ima
%         eval(['obj.wintx.' char(96+ii) '=[]'])
        eval(['clear wintx_' num2str(ii) ' winty_' num2str(ii)]);
    end
end

end
