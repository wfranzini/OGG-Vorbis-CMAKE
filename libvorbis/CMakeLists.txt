cmake_minimum_required(VERSION 3.0)

project (vorbis)

set(VORBIS_SOURCE_LIB
${CMAKE_CURRENT_SOURCE_DIR}/lib/analysis.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/bitrate.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/block.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/codebook.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/envelope.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/floor0.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/floor1.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/info.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/lookup.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/lpc.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/lsp.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/mapping0.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/mdct.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/psy.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/registry.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/res0.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/sharedbook.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/smallft.c
${CMAKE_CURRENT_SOURCE_DIR}/lib/synthesis.c

${CMAKE_CURRENT_SOURCE_DIR}/lib/window.c

)

add_library(${PROJECT_NAME} STATIC ${VORBIS_SOURCE_LIB})


target_include_directories(${PROJECT_NAME} 
PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_library (vorbisfile STATIC ${CMAKE_CURRENT_SOURCE_DIR}/lib/vorbisfile.c)
target_include_directories (vorbisfile PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_library (vorbisenc STATIC ${CMAKE_CURRENT_SOURCE_DIR}/lib/vorbisenc.c)
target_include_directories (vorbisenc	PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

include_directories (${CMAKE_CURRENT_SOURCE_DIR}/include)
include_directories (${CMAKE_CURRENT_SOURCE_DIR}/lib)

set_property(TARGET ${PROJECT_NAME} PROPERTY POSITION_INDEPENDENT_CODE ON)

target_link_libraries(${PROJECT_NAME} ogg)
target_link_libraries(vorbisenc vorbis)
target_link_libraries(vorbisfile vorbis)

