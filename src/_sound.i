/////////////////////////////////////////////////////////////////////////////
// Name:        _sound.i
// Purpose:     SWIG interface stuff for wxSound
//
// Author:      Robin Dunn
//
// Created:     18-June-1999
// RCS-ID:      $Id$
// Copyright:   (c) 2003 by Total Control Software
// Licence:     wxWindows license
/////////////////////////////////////////////////////////////////////////////

// Not a %module


//---------------------------------------------------------------------------
%newgroup

%{
#include <wx/sound.h>
%}    

//---------------------------------------------------------------------------

enum wxSoundFlags
{
    wxSOUND_SYNC   = 0,
    wxSOUND_ASYNC  = 1,
    wxSOUND_LOOP   = 2
};



%{
#if !wxUSE_SOUND
// A C++ stub class for wxWave for platforms that don't have it.
class wxSound : public wxObject
{
public:
    wxSound() {
        wxPyBeginBlockThreads();
        PyErr_SetString(PyExc_NotImplementedError,
                        "wxSound is not available on this platform.");
        wxPyEndBlockThreads();
    }
    wxSound(const wxString&, bool) {
        wxPyBeginBlockThreads();
        PyErr_SetString(PyExc_NotImplementedError,
                        "wxSound is not available on this platform.");
        wxPyEndBlockThreads();
    }
    wxSound(int, const wxByte*) {
        wxPyBeginBlockThreads();
        PyErr_SetString(PyExc_NotImplementedError,
                        "wxSound is not available on this platform.");
        wxPyEndBlockThreads();
    }
    
    ~wxSound() {};

    bool Create(const wxString&, bool) { return false; }
    bool Create(int, const wxByte*) { return false; };
    bool IsOk() { return false; };    
    bool Play(unsigned) const { return false; }
    static bool Play(const wxString&, unsigned) { return false; }
    static void Stop() {}
};

#endif
%}



class wxSound /*: public wxObject*/
{
public:
    %nokwargs wxSound;
    wxSound();
    wxSound(const wxString& fileName, bool isResource = false);
    wxSound(int size, const wxByte* data);
    ~wxSound();

    %nokwargs Create;
    %nokwargs Play;
    
    // Create from resource or file
    bool Create(const wxString& fileName, bool isResource = false);
    
    // Create from data
    bool Create(int size, const wxByte* data);

    bool  IsOk();
    
    // Play the sound:
    bool Play(unsigned flags = wxSOUND_ASYNC) const;

    // Plays sound from filename:
    %name(PlaySound)static bool Play(const wxString& filename, unsigned flags = wxSOUND_ASYNC);

    static void Stop();


    %pythoncode { def __nonzero__(self): return self.IsOk() }
};




//---------------------------------------------------------------------------
