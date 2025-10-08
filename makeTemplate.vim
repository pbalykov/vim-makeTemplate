function! FunSampleMake()
    let data = [
        \".PHONY: all clean run", "",
        \"CXX = c++", 
        \"CXXFLAGS = -Wall -std=c++17",
        \"LDFLAGS =",
        \"SOURCES =", 
        \"OBJECTS = \$(SOURCES:.cpp=.o)",
        \"TARGET =", "",
        \"all: \$(TARGET)", "",
        \"\$(TARGET): \$(OBJECTS)",
        \"\t\$(CXX) \$(OBJECTS) -o \$(TARGET) \$(LDFLAGS)","",
        \"%.o: %.cpp", 
        \"\t\$(CXX) \$(CXXFLAGS) -c $< -o $@", "",
        \"clean:",
        \"\trm -f \$(OBJECTS) \$(TARGET)", "",
        \"run: \$(TARGET)",
    \]

    if !filereadable("Makefile")
        execute 'sp Makefile' "
        call setline(1, data)
        write
    else
        execute 'sp Makefile'
    endif

endfunction

command! SamleMake call FunSampleMake()

function! ArrQMake(value) 
    if (value ~= 1 ) 
        return ["QT = core", "",
                \"CONFIG += c++17 cmdline", "",
                \"SOURCES += \\", "", "",
                \"HEADERS += \\",
                \]
    else 
        return ["QT = core gui", "",
                \"greaterThan(QT_MAJOR_VERSION, 4): QT += widgets", "",
                \"CONFIG += c++17 cmdline", "",
                \"SOURCES += \\", "", "",
                \"HEADERS += \\", "", "",
                \"FORMS += \\",
                \]

endfunction

function! FunSampleQmake(nameFile) 
    let name = a:nameFile . ".pro"
    if !(filereadable(name) )
        let choice = confirm("QMake выберите тип: ", "&Term\n&GUI", 1)
        let data = ArrQMake(choice)
        execute "sp " . name
        call setline(1, data)
        write
    else
        execute "sp " . name
    endif
endfunction

command! -nargs=* SamleQmake call FunSampleQmake(<f-args>)
