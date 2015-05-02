function varargout = ShadowRemover(varargin)
%   Remove unwanted intensity gradients from image. A by-product of ongoing computational
%   materials science research at MINED@Gatech.(http://mined.gatech.edu/)
%
%   Basic GUI for RemoveShadow for GRAYSCALE. Can definitely use more functionality, but won't 
%   work on it unless it comes up as an issue later.
%
%   Copyright (c) 2015, Ahmet Cecen  -  All rights reserved.
%
% SHADOWREMOVER MATLAB code for ShadowRemover.fig
%      SHADOWREMOVER, by itself, creates a new SHADOWREMOVER or raises the existing
%      singleton*.
%
%      H = SHADOWREMOVER returns the handle to a new SHADOWREMOVER or the handle to
%      the existing singleton*.
%
%      SHADOWREMOVER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHADOWREMOVER.M with the given input arguments.
%
%      SHADOWREMOVER('Property','Value',...) creates a new SHADOWREMOVER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ShadowRemover_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ShadowRemover_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ShadowRemover

% Last Modified by GUIDE v2.5 26-Nov-2014 03:58:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ShadowRemover_OpeningFcn, ...
                   'gui_OutputFcn',  @ShadowRemover_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before ShadowRemover is made visible.
function ShadowRemover_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ShadowRemover (see VARARGIN)

% Choose default command line output for ShadowRemover
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ShadowRemover wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Executes on button press in pushbutton1.


% --- Outputs from this function are returned to the command line.
function varargout = ShadowRemover_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
ESS = uiimport;
vars = fieldnames(ESS);
Image = ESS.(vars{1});
axes(handles.axes3);
imagesc(Image);axis off;colormap gray;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Image
global post
post=RemoveShadow(Image,'gray');
post=double(post);
post=(post-min(post(:)))/range(post(:));
axes(handles.axes4)
imagesc(post);axis off;colormap gray;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global post
axes(handles.axes4);colormap gray;
imsave(handles.axes4);


% --- Executes on button press in pushbutton7.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);colormap gray;


% --- Executes on button press in pushbutton8.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes3);colormap hot;
