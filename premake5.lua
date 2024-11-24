
project "ImGui"
	kind "StaticLib"
	language "C++"
	staticruntime "off"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"*.cpp",
		"*.h",
		
		-- "backends/imgui_impl_vulkan.cpp",
        "backends/imgui_impl_opengl3.cpp"
		"backends/imgui_impl_glfw.cpp",
        "%{IncludeDir.VulkanSDK}",
	}

	includedirs
	{
        "",
		"backends",
		"%{wks.location}/external/glfw/include",
        "%{IncludeDir.VulkanSDK}",
	}

    linkoptions
    {
        "-static-libstdc++",
        "-static-libgcc"
    }

	links
	{
		"glfw",
		"glad",
        "mingw32",
        "opengl32",
        "gdi32",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
