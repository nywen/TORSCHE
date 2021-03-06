function grapheditaboutdialog(varargin)
%DIALOG ABOUT for Graphedit. 
%   This file is part of Scheduling Toolbox.
%

% Author: Vojtech Navratil <navrav1@fel.cvut.cz>
% Originator: Michal Kutil <kutilm@fel.cvut.cz>
% Originator: Premysl Sucha <suchap@fel.cvut.cz>
% Project Responsible: Zdenek Hanzalek
% Department of Control Engineering
% FEE CTU in Prague, Czech Republic
% Copyright (c) 2004 - 2009 
% $Revision: 2897 $  $Date:: 2009-03-18 15:17:31 +0100 #$


% This file is part of TORSCHE Scheduling Toolbox for Matlab.
% TORSCHE Scheduling Toolbox for Matlab can be used, copied 
% and modified under the next licenses
%
% - GPL - GNU General Public License
%
% - and other licenses added by project originators or responsible
%
% Code can be modified and re-distributed under any combination
% of the above listed licenses. If a contributor does not agree
% with some of the licenses, he/she can delete appropriate line.
% If you delete all lines, you are not allowed to distribute 
% source code and/or binaries utilizing code.
%
% --------------------------------------------------------------
%                  GNU General Public License  
%
% TORSCHE Scheduling Toolbox for Matlab is free software;
% you can redistribute it and/or modify it under the terms of the
% GNU General Public License as published by the Free Software
% Foundation; either version 2 of the License, or (at your option)
% any later version.
% 
% TORSCHE Scheduling Toolbox for Matlab is distributed in the hope
% that it will be useful, but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or 
% FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with TORSCHE Scheduling Toolbox for Matlab; if not, write
% to the Free Software Foundation, Inc., 59 Temple Place,
% Suite 330, Boston, MA 02111-1307 USA



    h = dialog('ButtonDownFcn','','Visible','off','Tag','about','Name','About');

    im = imread('private/grapheditclock.jpg');
    [height,width,x] = size(im);
    
    positionDialog = tocenter(width,height);
    positionAxes = [15 44 width height];  
    
    image(im);
    set(gca,'Visible','off','Units','pixels','Position',positionAxes);      
 
    uicontrol('Parent',h,'Style','text','FontSize',7,...
        'String','For opening web page click to some text in picture.',...
        'Position',[15 10 340 18],'HorizontalAlignment','left');
    uicontrol('Parent',h,'Style','pushbutton','String','Close',...
        'Position',[positionDialog(3)-100 10 80 24],'Callback',{@delete,h});
    set(h,'WindowStyle','modal','Position',positionDialog,'Visible','on');
        
    settext(gca);
    
    
function settext(hAxes)
    blue = [63 120 255]/255;
    
    t = text(10,15,'Department of Control Engineering');
    set(t,...
        'Color',blue,...  
        'ButtonDownFcn','web http://dce.felk.cvut.cz -browser',...
        'FontUnits','Pixels',...
        'FontAngle','italic',...
        'FontSize',13,...
        'FontWeight','bold',...
        'FontName','Arial');
    t = text(10,33,'Faculty of Electrical Engineering, CTU Prague, Czech Republic');
    set(t,...
        'Color',blue,...
        'ButtonDownFcn','web http://www.fel.cvut.cz -browser',...
        'FontUnits','Pixels',...
        'FontAngle','italic',...
        'FontSize',13,...
        'FontName','Arial');

    t = text(78,88,'Graphedit');
    set(t,...
        'Color',blue,... %       'FontAngle','italic',...
        'FontUnits','Pixels',...
        'FontSize',50,...
        'FontWeight','bold',...
        'FontName','Arial');

    t = text(390,160,sprintf('TORSCHE Scheduling Toolbox\nfor Matlab'));
    set(t,...
        'Color',blue,...
        'ButtonDownFcn','web http://rtime.felk.cvut.cz/scheduling-toolbox/ -browser',...
        'FontUnits','Pixels',...
        'HorizontalAlignment','right',...
        'FontSize',24,...
        'FontWeight','bold',...
        'FontName','Arial');
    
    t = text(390,226,sprintf('Vojtech Navratil,'));
    set(t,...
        'Color',blue,...
        'HorizontalAlignment','right',...
        'FontUnits','Pixels',...
        'FontAngle','italic',...
        'FontSize',13,...
        'FontWeight','bold',...
        'FontName','Arial');
%     t = text(390,227,sprintf('Bachelor Project,'));
%     set(t,...
%         'Color',blue,...
%         'HorizontalAlignment','right',...
%         'FontUnits','Pixels',...
%         'FontAngle','italic',...
%         'FontSize',13,...
%         'FontWeight','bold',...
%         'FontName','Arial');
    t = text(390,244,sprintf('mailto: navrav1@fel.cvut.cz'));
    set(t,...
        'Color',blue,...
        'ButtonDownFcn','web mailto:navrav1@fel.cvut.cz',...
        'FontUnits','Pixels',...
        'HorizontalAlignment','right',...
        'FontAngle','italic',...
        'FontSize',13,...
        'FontName','Arial');
   
%    web http://www.mathworks.com -browser
%    web mailto:email_address

    
function position = tocenter(width,height)
    monitor = get(0,'ScreenSize');
    position(3) = width + 30;
    position(4) = height + 54;
    position(1) = monitor(1) + (monitor(3)-position(3)) / 2;
    position(2) = monitor(2) + (monitor(4)-position(4)) / 2;

    
