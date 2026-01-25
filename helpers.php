<?php

	function p($var) {
		echo "<pre>";
		print_r($var);
		echo "</pre>";
	}


	function pd($var) {
		echo "<pre>";
		print_r($var);
		echo "</pre>";
		die();
	}


	function redirect($url) {
		header("Location: " . $url);
		exit();
	}

	function pluralForm(int $number, array $titles): string {
		$cases = [2, 0, 1, 1, 1, 2];
		return $titles[($number % 100 > 4 && $number % 100 < 20) ? 2 : $cases[min($number % 10, 5)]];
	}