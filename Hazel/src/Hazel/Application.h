#pragma once
#include "Core.h"
namespace Hazel {
	class HAZEL_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};
	// To be definer in CLIENT
	Application* CreateApplication();
}