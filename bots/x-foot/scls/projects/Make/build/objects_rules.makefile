./projects/Make/build/ai.o : sources/ai.cpp 
	@echo -n "[ $@ ] : Dependencies... "
	@$(DEP_MAKER) $(INCLUDES) $(W_NO) $(DEP_MAKER_FLAGS) $< > ./projects/Make/build/ai.d 
	@$(CGM_DIR)fixdepend.sh $(CGM_DIR) $(BUILD_DIR) ./projects/Make/build/ai.d
	@echo -n "Compiling... "
	@$(CXX) $(INCLUDES) $(CXX_OPTION_FLAGS) $(CXXFLAGS) $@ $< 
	@echo done
