#pragma once
//#include "Application.h"
#ifdef HZ_PLATFORM_WINDOWS
extern  Hazel::Application* Hazel::CreateApplication();
int main(int argc,char** argv) {
	printf("Hazel Engine");
	auto app = Hazel::CreateApplication();
	app->Run();
	delete app;
	//Sandbox* sandbox = new Sandbox();
	//sandbox->Run();
	//delete sandbox;
}
#endif