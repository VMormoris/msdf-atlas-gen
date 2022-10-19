project "msdf-atlas-gen"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"msdf-atlas-gen/**.h",
		"msdf-atlas-gen/**.hpp",
		"msdf-atlas-gen/**.cpp",
	}

	removefiles
	{
		"msdf-atlas-gen/main.cpp",
	}

	includedirs
	{
		"msdfgen/include",
		"msdfgen/freetype/include",
		"msdfgen",
		"artery-font-format",
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"MSDFGEN_USE_CPP11",
	}

	links
	{
		"freetype",
		"msdfgen",
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"