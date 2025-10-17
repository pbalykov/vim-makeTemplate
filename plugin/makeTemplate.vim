" plugin/makeTemplate.vim
" Vim plugin for creating build system templates
" Author: pbalykov
" Version: 1.0.0

if exists('g:loaded_make_template')
    finish
endif
let g:loaded_make_template = 1

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
        tabnew Makefile
        call setline(1, data)
        write
    else
        tabnew Makefile
    endif

endfunction

function! ArrQMake(value) 
    let templates = {
        \ 1: ["QT = core", "",
            \ "CONFIG += c++17 cmdline", "",
            \ "SOURCES += \\", "", "",
            \ "HEADERS += \\"],
        \ 2: ["QT = core gui", "",
            \ "greaterThan(QT_MAJOR_VERSION, 4): QT += widgets", "",
            \ "CONFIG += c++17 cmdline", "",
            \ "SOURCES += \\", "", "",
            \ "HEADERS += \\", "", "",
            \ "FORMS += \\"]
        \ }
    return get(templates, a:value, [])
endfunction

function! FunSampleQmake(nameFile) 
    let name = a:nameFile . ".pro"
    if !(filereadable(name) )
        let choice = confirm("QMake выберите тип: ", "&Term\n&GUI", 1)
        let data = ArrQMake(choice)
        tabnew name
        call setline(1, data)
        write
    else
        tabnew name
    endif
endfunction

function! FunSampleCMake()
    if !(filereadable("CMakeLists.txt") ) 
        let data = ["cmake_minimum_required(VERSION 3.10)",
                    \"project(MyProject)", "",
                    \"set(CMAKE_CXX_STANDARD 17)", "",
                    \"set(HEADERS", "", ")", "",
                    \"add_executable(${PROJECT_NAME}", "",
                    \"${HEADERS}",
                    \")", "",
                    \"target_include_directories(${PROJECT_NAME} PRIVATE include)", "",
            \"target_compile_options(${PROJECT_NAME} PRIVATE -Wall -Wextra)"
            \]
        tabnew "CMakeLists.txt"
        call setline(1, data)
        write
    else
        tabnew "CMakeLists.txt"
    endif
endfunction

command! SamleMake call FunSampleMake()
command! SamleCMake call FunSampleCMake()
command! -nargs=* SamleQmake call FunSampleQmake(<f-args>)
