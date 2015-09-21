$(document).ready(function(){

	/**
	 * Initiating variables and arrays
	 */

	var $chosen_word_id = $(".hidden").text();
	var $chosen_words_array = ["#chosen_word_one_div","#chosen_word_two_div","#chosen_word_three_div","#chosen_word_four_div"];
	var $words_array_five_each = [];
	var $counter = 0;
	var $correct_word_proggress_bar_without_pbc_class = "";

	// Start the main activity
	start_level_2();

	/**
	 * Starter Functions: Main ones that initiate each activity
	 */

	// Start level 2 activity
	function start_level_2() {
		// Get the details of all words
		$.ajax({
			type: "GET",
			url: "/jeopardy_game_words?word_id=" + $chosen_word_id,
			dataType: "json",
			success: function (response) {
				var $chosen_word = response.word_names[0]
				var $second_word = response.word_names[1]
				var $third_word = response.word_names[2]
				var $fourth_word = response.word_names[3]
				var $jeopardy_lineup_names = response.jeopardy_lineup_names
				var $attributes_array = response.attributes_array;
				var $attribute_values = response.attribute_values

				// Display the text for the remaining three buttons
				update_button_text("#chosen_word_one_btn", $chosen_word);
				update_button_text("#chosen_word_two_btn", $second_word);
				update_button_text("#chosen_word_three_btn", $third_word);
				update_button_text("#chosen_word_four_btn", $fourth_word);

				console.log("****************");
				console.log("Question Types (before click):", $attributes_array);
				console.log("Word Order (before click):", $jeopardy_lineup_names);
				console.log("Current word in the 20-word array (before clicked):", $jeopardy_lineup_names[$counter]);
				console.log("Randomly chosen question type (before clicked):", $attributes_array[$counter]);
				console.log("****************");

				var $current_word = $jeopardy_lineup_names[$counter]

				// Update the activity name and instruction
				display_activity_instruction($attributes_array[$counter], $attribute_values[$counter]);

			//
			// 	answer_the_question("#chosen_word_one_btn","#chosen_word_one_progress_bars_div .progress-bar-custom:first");
			// 	answer_the_question("#chosen_word_two_btn","#chosen_word_two_progress_bars_div .progress-bar-custom:first");
			// 	answer_the_question("#chosen_word_three_btn","#chosen_word_three_progress_bars_div .progress-bar-custom:first");
			// 	answer_the_question("#chosen_word_four_btn","#chosen_word_four_progress_bars_div .progress-bar-custom:first");
			//
			// 	// Handles what happens when user answers correctly and incorrectly
			// 	function answer_the_question(button_id_name, first_mini_progress_bar_without_pbc_class) {
			// 		$(button_id_name).click(function(){
			// 			// If the user's guess is correct
			// 			if ($(this).text() == $words_array_five_each[$current_word_counter]) {
			// 				// Update the nth mini progress bar for that word
			// 				$(first_mini_progress_bar_without_pbc_class).removeClass("progress-bar-custom").addClass("progress-bar-success");
			// 			}
			//
			// 			// If the user's guess is incorrect -->
			// 			// Find the id of the correct word to update the nth progress bar as incorrect /
			// 			if ($(this).text() != $words_array_five_each[$current_word_counter]) {
			// 				$correct_word_proggress_bar_without_pbc_class = "#" +
			// 						$("button:contains('"+$words_array_five_each[$current_word_counter]+"')")
			// 						.next()
			// 						.attr("id")
			// 						+ " .progress-bar-custom:first"
			// 					;
			// 				$($correct_word_proggress_bar_without_pbc_class).removeClass("progress-bar-custom").addClass("progress-bar-danger");
			// 			}
			//
			// 			// Total up the goodies
			// 			get_goodies();
			//
			// 			// Shuffle the question types
			// 			shuffle_array($question_type_array);
			// 			// Increase the counter
			// 			$current_word_counter++;
			// 			console.log("Current word in the 20-word array (after clicked):",$words_array_five_each[$current_word_counter]);
			// 			console.log("Randomly chosen question type (after clicked):",$question_type_array[0]);
			// 			console.log("Question Types (after clicked):",$question_type_array[0]);
			// 			console.log("Counter (after btn is clicked):",$current_word_counter);
			// 			console.log("****************");
			// 			display_activity_instruction(
			// 				$question_type_array[0],
			// 				$(xml).find($words_array_five_each[$current_word_counter]).children().find($question_type_array[0]+":first").text()
			// 			);
			//
			// 			// When the game is over, display "complete" message
			// 			if ($current_word_counter == 20) {
			// 				$("#chosen_word_one_btn").prop("disabled",true);
			// 				$("#chosen_word_two_btn").prop("disabled",true);
			// 				$("#chosen_word_three_btn").prop("disabled",true);
			// 				$("#chosen_word_four_btn").prop("disabled",true);
			// 				display_activity_instruction("Ready for the results?", "3...2...1...");
			// 				setTimeout(function(){
			// 					$("#level_2_container").hide();
			// 					$("#review_level_two_container").fadeIn();
			//
			// 					display_level_2_results(
			// 						"#chosen_word_one_progress_bars_div",
			// 						"#level_two_results_first_circle",
			// 						"#level_two_results_first_word",
			// 						$first_word
			// 					);
			//
			// 					display_level_2_results(
			// 						"#chosen_word_two_progress_bars_div",
			// 						"#level_two_results_second_circle",
			// 						"#level_two_results_second_word",
			// 						$second_word
			// 					);
			//
			// 					display_level_2_results(
			// 						"#chosen_word_three_progress_bars_div",
			// 						"#level_two_results_third_circle",
			// 						"#level_two_results_third_word",
			// 						$third_word
			// 					);
			//
			// 					display_level_2_results(
			// 						"#chosen_word_four_progress_bars_div",
			// 						"#level_two_results_fourth_circle",
			// 						"#level_two_results_fourth_word",
			// 						$fourth_word
			// 					);
			//
			// 				}, 3000);
			// 			}
			// 		});
			// 	}; // end of answer the question fn
			} // end of the success parameter in the ajax fn
		}); // end of the ajax function
	}; // end of start level 2 fn


	/**
	 * Helper Functions: Support ones that help each activity above
	 */

	// Display which words move up or down
	function display_level_2_results(
		chosen_word_num_progress_bars_div,
		level_two_results_num_circle,
		level_two_results_num_word,
		word_num
		) {
		if ($(chosen_word_num_progress_bars_div + " .progress-bar-success").length > 2) {
			$(level_two_results_num_circle).html("&#8593;");
			$(level_two_results_num_word).html(
																				"<strong>'" + word_num +
																				"'</strong> " +
																				"moves up to Level 3!"
																				);
		}
		else {
			$(level_two_results_num_circle).html("&#8595;");
			$(level_two_results_num_word).html(
																				"<strong>'" + word_num +
																				"'</strong> " +
																				"returns to Level 1."
																				);
		}
	};

	// Computes the goodies
	function get_goodies() {
		var $all_the_goodies = 0;
		$('.progress-bar-success').each(function(){
			$all_the_goodies += parseInt($(this).text());
			$("#goodies_total").html($all_the_goodies);
		});
	};

	// Display the button-text for the chosen words
	function update_button_text(chosen_word_num_btn, name) {
		$(chosen_word_num_btn).text(name);
	};

	// Global fn

	//Change the activity name and specific directions depending on current state
	function display_activity_instruction(activity_name, specific_instruction) {
		$("#activity_name").html(activity_name);
		$("#specific_instruction").html(specific_instruction);
	};

	// Global fn
	// Set the value for the progress bar
	function progressBar(value) {
		$('.progress-bar').css('width', value+'%').attr('aria-valuenow', value);
	};

	// Global fn
	// Get a random number between y and x
	function randomRange (x, y) {
		return Math.floor(Math.random()* (x-y) + y);
	};

	// Global fn
	// Shuffle an array's contents
	function shuffle_array(array) {
		var m = array.length, t, i;
		// While there remain elements to shuffle…
		while (m) {
			// Pick a remaining element…
			i = Math.floor(Math.random() * m--);
			// And swap it with the current element.
			t = array[m];
			array[m] = array[i];
			array[i] = t;
		}
		return array;
	};

	// Global fn
	// Shortcut for retrieving an element's ID
	function _(x) {
		return document.getElementById(x);
	};
}); // end of document ready fn
