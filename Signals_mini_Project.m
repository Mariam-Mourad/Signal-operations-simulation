
function varargout = Signals_mini_Project(varargin)
% SIGNALS_MINI_PROJECT MATLAB code for Signals_mini_Project.fig
%      SIGNALS_MINI_PROJECT, by itself, creates a new SIGNALS_MINI_PROJECT or raises the existing
%      singleton*.
%
%      H = SIGNALS_MINI_PROJECT returns the handle to a new SIGNALS_MINI_PROJECT or the handle to
%      the existing singleton*.
%
%      SIGNALS_MINI_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGNALS_MINI_PROJECT.M with the given input arguments.
%
%      SIGNALS_MINI_PROJECT('Property','Value',...) creates a new SIGNALS_MINI_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Signals_mini_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Signals_mini_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Signals_mini_Project

% Last Modified by GUIDE v2.5 21-Nov-2019 16:41:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Signals_mini_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Signals_mini_Project_OutputFcn, ...
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


% --- Executes just before Signals_mini_Project is made visible.
function Signals_mini_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Signals_mini_Project (see VARARGIN)

% Choose default command line output for Signals_mini_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Signals_mini_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear all
clc
global conc_signal i conc_t conc_poly_coeff
i=0;
conc_signal=[];
conc_t=[];
conc_poly_coeff=[];
% --- Outputs from this function are returned to the command line.
function varargout = Signals_mini_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
global selected_operation 
contents = cellstr(get(hObject,'String'))
selected_operation=contents{get(hObject,'Value')} 
switch selected_operation
    case 'Amplitude Scaling'
        set(handles.text18,'visible','on')
        set(handles.text19,'visible','off')
        set(handles.text20,'visible','off')
        set(handles.text21,'visible','off')
        set(handles.edit13,'visible','on')
        set(handles.edit14,'visible','off')
        set(handles.edit15,'visible','off')
        set(handles.edit16,'visible','off')
    case'Time Reverse'
        
        set(handles.text18,'visible','off')
        set(handles.text19,'visible','off')
        set(handles.text20,'visible','off')
        set(handles.text21,'visible','off')
        set(handles.edit13,'visible','off')
        set(handles.edit14,'visible','off')
        set(handles.edit15,'visible','off')
        set(handles.edit16,'visible','off')
    case'Time Shift'
        set(handles.text18,'visible','off')
        set(handles.text19,'visible','on')
        set(handles.text20,'visible','off')
        set(handles.text21,'visible','off')
        set(handles.edit13,'visible','off')
        set(handles.edit14,'visible','on')
        set(handles.edit15,'visible','off')
        set(handles.edit16,'visible','off')
    case'Expanding the Signal'
        set(handles.text18,'visible','off')
        set(handles.text19,'visible','off')
        set(handles.text20,'visible','on')
        set(handles.text21,'visible','off')
        set(handles.edit13,'visible','off')
        set(handles.edit14,'visible','off')
        set(handles.edit15,'visible','on')
        set(handles.edit16,'visible','off')
    case'Compressing the Signal'
        set(handles.text18,'visible','off')
        set(handles.text19,'visible','off')
        set(handles.text20,'visible','off')
        set(handles.text21,'visible','on')
        set(handles.edit13,'visible','off')
        set(handles.edit14,'visible','off')
        set(handles.edit15,'visible','off')
        set(handles.edit16,'visible','on')
    case'None'
        set(handles.text18,'visible','off')
        set(handles.text19,'visible','off')
        set(handles.text20,'visible','off')
        set(handles.text21,'visible','off')
        set(handles.edit13,'visible','off')
        set(handles.edit14,'visible','off')
        set(handles.edit15,'visible','off')
        set(handles.edit16,'visible','off')
end

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global selected_operation conc_signal conc_t
Scale_Value=str2double(get(handles.edit13,'String'));
Shift_Value=str2double(get(handles.edit14,'String'));
Expanding_Value=str2double(get(handles.edit15,'String'));
Compressing_Value=str2double(get(handles.edit16,'String'));
switch selected_operation
    case'Amplitude Scaling'
        conc_signal=Scale_Value*conc_signal;
        
     case'Time Reverse'
    

conc_signal=fliplr(conc_signal);
conc_t=fliplr(-conc_t);

     case'Time Shift'
           
            if Shift_Value >=0
               conc_t=conc_t+Shift_Value;
            else
                 conc_t=conc_t-abs(Shift_Value);
            end
            
    case'Expanding the Signal'
        conc_t=[conc_t*Expanding_Value];
        
        
    case'Compressing the Signal'
         conc_t=[conc_t/Compressing_Value];
    case'None'

end
plot(conc_t,conc_signal,'Parent',handles.axes3)
hold off
grid on

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global selected_signal 
contents = cellstr(get(hObject,'String'))
selected_signal=contents{get(hObject,'Value')} 
switch selected_signal
    case 'DC signal'
        set(handles.text9,'visible','on')
        set(handles.text10,'visible','off')
        set(handles.text11,'visible','off')
        set(handles.text12,'visible','off')
        set(handles.text13,'visible','off')
        set(handles.text14,'visible','off')
        set(handles.text15,'visible','off')
        set(handles.edit6,'visible','on')
        set(handles.edit7,'visible','off')
        set(handles.edit11,'visible','off')
        set(handles.edit8,'visible','off')
        set(handles.edit9,'visible','off')
        set(handles.edit10,'visible','off')
        set(handles.edit12,'visible','off')
        set(handles.text23,'visible','off')
        set(handles.text24,'visible','off')
        set(handles.pushbutton3,'visible','off')
 case 'Ramp signal'
        set(handles.text9,'visible','off')
        set(handles.text10,'visible','on')
        set(handles.text11,'visible','off')
        set(handles.text12,'visible','on')
        set(handles.text13,'visible','off')
        set(handles.text14,'visible','off')
        set(handles.text15,'visible','off')
        set(handles.edit6,'visible','off')
        set(handles.edit7,'visible','on')
        set(handles.edit11,'visible','off')
        set(handles.edit8,'visible','on')
        set(handles.edit9,'visible','off')
        set(handles.edit10,'visible','off')
        set(handles.edit12,'visible','off') 
        set(handles.text23,'visible','off')
        set(handles.text24,'visible','off')
        set(handles.pushbutton3,'visible','off')
 case 'General Order polynomial'
        set(handles.text9,'visible','on')
        set(handles.text10,'visible','off')
        set(handles.text11,'visible','on')
        set(handles.text12,'visible','off')
        set(handles.text13,'visible','off')
        set(handles.text14,'visible','off')
        set(handles.text15,'visible','off')
        set(handles.edit6,'visible','on')
        set(handles.edit7,'visible','off')
        set(handles.edit11,'visible','on')
        set(handles.edit8,'visible','off')
        set(handles.edit9,'visible','off')
        set(handles.edit10,'visible','off')
        set(handles.edit12,'visible','off')
        set(handles.text23,'visible','on')
        set(handles.text24,'visible','on')
        set(handles.pushbutton3,'visible','on')
  case 'Exponential signal'
        set(handles.text9,'visible','on')
        set(handles.text10,'visible','off')
        set(handles.text11,'visible','off')
        set(handles.text12,'visible','off')
        set(handles.text13,'visible','on')
        set(handles.text14,'visible','off')
        set(handles.text15,'visible','off')
        set(handles.edit6,'visible','on')
        set(handles.edit7,'visible','off')
        set(handles.edit11,'visible','off')
        set(handles.edit8,'visible','off')
        set(handles.edit9,'visible','on')
        set(handles.edit10,'visible','off')
        set(handles.edit12,'visible','off')
        set(handles.text23,'visible','off')
        set(handles.text24,'visible','off')
        set(handles.pushbutton3,'visible','off')
 case 'Sinusoidal signal'
        set(handles.text9,'visible','on')
        set(handles.text10,'visible','off')
        set(handles.text11,'visible','off')
        set(handles.text12,'visible','off')
        set(handles.text13,'visible','off')
        set(handles.text14,'visible','on')
        set(handles.text15,'visible','on')
        set(handles.edit6,'visible','on')
        set(handles.edit7,'visible','off')
        set(handles.edit11,'visible','off')
        set(handles.edit8,'visible','off')
        set(handles.edit9,'visible','off')
        set(handles.edit10,'visible','on')
        set(handles.edit12,'visible','on')
        set(handles.text23,'visible','off')
        set(handles.text24,'visible','off')
        set(handles.pushbutton3,'visible','off')
        
        
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

global pow
pow=str2double(get(handles.edit11,'String'));
set(handles.text24,'String',pow)
% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i selected_signal conc_signal conc_t End_past t signal conc_poly_coeff

%taking readings from GUI
BreakPoints=str2double(get(handles.edit2,'String'));
SamplingFrequency=1/str2double(get(handles.edit1,'String'));
StartTime=str2double(get(handles.edit3,'String'));
EndTime=str2double(get(handles.edit4,'String'));
set(handles.text17,'string',(i+1))
Amplitude=str2double(get(handles.edit6,'String'));
Slope=str2double(get(handles.edit7,'String'));
Power=str2double(get(handles.edit11,'String'));
Intercept=str2double(get(handles.edit8,'String'));
Exponent=str2double(get(handles.edit9,'String'));
Frequency=str2double(get(handles.edit10,'String'));
Phase=str2double(get(handles.edit12,'String'));
if(i<(BreakPoints+1))
if(i==0)
         t = (StartTime:SamplingFrequency:EndTime)'; %(start, step, end)
else
           t = (End_past+SamplingFrequency:SamplingFrequency:EndTime)'; %(start, step, end)
end
 switch selected_signal
     case 'DC signal'
        if(i==0)
        unitstep = t>=StartTime;%breakpoint
        else
        unitstep = t>=(End_past+SamplingFrequency);%breakpoint
        end
        signal=Amplitude*unitstep; %amplitude
      
     case 'Ramp signal'
        
signal = Slope*t+Intercept; %(Amp,intercept)

         
     case'General Order polynomial'
     signal=polyval([conc_poly_coeff], t)%coefficients
%     stem(t, polyval([signal], t),'Parent',handles.axes1);


      case'Exponential signal'
 signal=Amplitude*exp(Exponent*t); %(Amp,Exponential)
  
          
     case  'Sinusoidal signal'
         
       signal=Amplitude*sin((Frequency*t)+Phase);%(range, phase)  
 end
 
  conc_t=[conc_t ;t]
  conc_signal=[conc_signal ;signal]
  plot(conc_t, conc_signal,'Parent',handles.axes1)
  
  hold on
  grid on
  End_past=EndTime

i=i+1
if ( i>0)
        set(handles.edit1,'visible','off')
        set(handles.edit2,'visible','off')
        set(handles.edit3,'visible','off')
        set(handles.edit2,'visible','off')
        set(handles.text2,'visible','off')
        set(handles.text3,'visible','off')
        set(handles.text4,'visible','off')
        
       
        
end


end




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double



% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function breakpoint_Callback(hObject, eventdata, handles)
% hObject    handle to breakpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of breakpoint as text
%        str2double(get(hObject,'String')) returns contents of breakpoint as a double


% --- Executes during object creation, after setting all properties.
function breakpoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to breakpoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global conc_poly_coeff pow
conc_poly_coeff=[conc_poly_coeff; str2double(get(handles.edit6,'String'))]
if (pow>0)
pow=pow-1;
end
set(handles.text24,'String',pow)
