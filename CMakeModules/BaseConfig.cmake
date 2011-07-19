if (CMAKE_COMPILER_IS_GNUCC)

	set(RSN_BASE_C_FLAGS      "-Wall")
	set(CMAKE_C_FLAGS         "${CMAKE_C_FLAGS} ${RSN_BASE_C_FLAGS} -DPROJECT_VERSION=\"${PROJECT_VERSION}\"")
	set(CMAKE_C_FLAGS_DEBUG   "${CMAKE_C_FLAGS_DEBUG} ${RSN_BASE_C_FLAGS} -ggdb")
	set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${RSN_BASE_C_FLAGS}") 

	if(APPLE) 
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wshorten-64-to-32 -D_BSD_SOURCE")
	endif(APPLE)

	if (UNIX) 
		set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_BSD_SOURCE -D_POSIX_C_SOURCE=199309L")
	endif(UNIX)

endif(CMAKE_COMPILER_IS_GNUCC)

if (DISABLE_EVTHR)
       set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_EVTHR")
endif(DISABLE_EVTHR)

if (DISABLE_SSL)
			set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DDISABLE_SSL")
endif(DISABLE_SSL)

if (NOT CMAKE_BUILD_TYPE)
	set(CMAKE_BUILD_TYPE Release)
endif(NOT CMAKE_BUILD_TYPE)

if (${CMAKE_BUILD_TYPE} STREQUAL Debug)
	set(EXPAND_HTTP_PARSER_MACROS ON)
endif(${CMAKE_BUILD_TYPE} STREQUAL Debug)
