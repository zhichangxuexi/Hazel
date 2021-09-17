workspace "Hazel" -- 解决方案
    architecture "x64"
    startproject "Sandbox"
    configurations
    {
        "Debug",
        "Release",
		"Dist"
    }
-- 输出目录   后面用到
outputdir="%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Hazel"
    location "Hazel"
	kind "SharedLib"
	language "C++"
	
    targetdir("bin/x64/" .. outputdir ) -- 字符串拼接..
	objdir("bin/int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
	   "%{prj.name}/src/**.h",
	   "%{prj.name}/src/**.cpp"
	}
	includedirs
	{
	   "%{prj.name}/vendor/spdlog/include",
	}
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "on"
		systemversion "10.0"
		
		defines
		{
			"HZ_PLATFORM_WINDOWS",
			"HZ_BUILD_DLL"
		}
	    
		postbuildcommands-- 编译后拷贝
		{
		 
		}
    filter "configurations:Debug"
		defines {"HZ_DEBUG"}
		symbols "On"
	filter "configurations:Release"
		defines {"HZ_RELEASE"}
		symbols "On"
	filter "configurations:Dist"
		defines {"HZ_DIST"}
		symbols "On"
project "Sandbox"
    location "Sandbox"
	kind "ConsoleApp"
	
	language "C++"
    targetdir("bin/x64/" .. outputdir  )
	objdir("bin/int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
	   "%{prj.name}/src/**.h",
	   "%{prj.name}/src/**.cpp"
	}
	includedirs
	{
	   "Hazel/vendor/spdlog/include",
	   "Hazel/src"
	}
	links
	{
		"Hazel"
	}
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "on"
		systemversion "10.0"
		
		defines
		{
			"HZ_PLATFORM_WINDOWS"
		}
	    
		postbuildcommands-- 编译后拷贝
		{
		
		}
    filter "configurations:Debug"
		defines {"HZ_DEBUG"}
		symbols "On"
	filter "configurations:Release"
		defines {"HZ_RELEASE"}
		symbols "On"
	filter "configurations:Dist"
		defines {"HZ_DIST"}
		symbols "On"