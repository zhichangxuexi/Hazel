#pragma once

#ifdef HZ_PLATFORM_WINDOWS
extern  Hazel::Application* Hazel::CreateApplication();
int main(int argc,char** argv) {
	spdlog::info("Welcome to spdlog!");//�򵥵��÷�
	spdlog::error("Some error message with arg: {}", 1);//�򵥵��÷�
	//�߶��÷�
	Hazel::Log::Init();
	HZ_CORE_WARN("Initialized log!");
	int a = 5;
	HZ_INFO("Hello!={0}",a);
	//�߶��÷� ����
	auto app = Hazel::CreateApplication();
	app->Run();
	delete app;
	//Sandbox* sandbox = new Sandbox();
	//sandbox->Run();
	//delete sandbox;
	return 0;
}
#endif