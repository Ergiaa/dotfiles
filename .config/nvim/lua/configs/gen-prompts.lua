local gen = require "gen"

gen.prompts["Fix_Code"] = {
  prompt = "Fix the following code without adding any extra comments:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```",
  -- model = "deepseek-coder:6.7b",
}

gen.prompts["Explain_Function"] = {
  prompt = "Explain the following function briefly:\n```$filetype\n$text\n```",
  replace = false,
  -- model = "deepseek-coder:6.7b",
}

gen.prompts["Refactor"] = {
  prompt = "Refactor the following code to make it cleaner and more readable without changing its functionality:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```",
  -- model = "deepseek-coder:6.7b",
}

gen.prompts["Generate_Tests"] = {
  prompt = "Generate comprehensive unit tests for the following code:\n```$filetype\n$text\n```",
  replace = false, -- jangan replace code asli, biar hasil test muncul terpisah
  extract = "```$filetype\n(.-)```",
  -- model = "deepseek-coder:6.7b",
}

gen.prompts["Optimize_Code"] = {
  prompt = "Optimize the following code for performance and readability without changing its functionality:\n```$filetype\n$text\n```",
  replace = true, -- replace dengan versi optimized
  extract = "```$filetype\n(.-)```",
  -- model = "deepseek-coder:6.7b",
}

gen.prompts["Add_Documentation"] = {
  prompt = "Add clear and concise documentation and inline comments to the following code:\n```$filetype\n$text\n```",
  replace = true, -- replace dengan versi yang sudah ada comment
  extract = "```$filetype\n(.-)```",
  -- model = "deepseek-coder:6.7b",
}
