{
  "categories": {
    "Vlocity": {
      "rootfolder": "{$Context.Property.vlocity_root_folder}/**",
      "defaultFolder": "vlocity/**"
    },
    "SFDX": {
      "rootfolder": [],
      "config": {
        "filepath": "sfdx-project.json",
        "property": "packageDirectories[].path"
      },
      "defaultFolder": "force-app/**",
      "exclude": {
        "filePattern": [
          "**/__tests__/**",
          "**/.eslintrc.json",
          "**/jsconfig.json"
        ]
      }
    },
    "Other": {
      "default": true
    }
  }
}