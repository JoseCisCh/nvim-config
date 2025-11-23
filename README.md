# Successfully configure neovim.

## General steps

Requirements for the **nvim** configuration to work:

  - **curl** installed.
  - **nodejs** and npm installed.
  - **clang** installed, maybe other c compliler would work.
  - Decide whether to use **java LSP** or not (based on projects)
      - Install **jdtls**, in my case I intalled it using mason.
      - configure **nvim-jdtls** to use the Mason jdtls lsp.
          - lua/jcisneros/java.lua
          - ftplugin/java-

  - Install and configure **postgresql** user to set **dadbod** default connection (this is an optional step);
    - Change the database `username` in case that it is necessary.
  
  - Regarding the mason and **mason-lspconfig:**
      - For some reason if we install directly these dependencies without specifying
        the version we want, the version downloaded will be a version that does not
        work correctly (I think there was a big change when version 2.0 was released).
        This happened to me when trying to configure **nvim** in an **Alpine** container 
        (I installed **neovim** using awk add and the version installed was **nvim** 10.x.
        this is important to mention as this was a different version than the one I had
        in my personal computer (11.x))
        To solve this issues there are two possible ways:

          1. Install the exact versions that I have installed in the **neovim** in my
             personal computer
              
                - mason.nvim -> tag v1.11.0
                - mason-lspconfig -> tag v1.32.0 

          2. Use the new version of both plugins and figure out what changes
             I would have to do to my general configuration for it to work.

**Note**: ** An error occurs dureing the installation attempt for some **lsps** (lua and )
      ** when tying to install in **Alpine** linux. ( **non-GNU** distribution)

---

## Java.

### Java: LSP

In the case of Java LSP (**jdlts**) I had to make some hard coded configs in the SDK paths to make it work.

  - nvim `JAVA_HOME`variable was set to **Corretto 21** in order to make jdlts work. This was made in **java.lua** file.
  - In **lsp-config.lua** I set the paths for the **Java runtimes**
  - In case of need, change the path of the **Java sdk**. By default it takes a path assuming that **SDKMAN** is installed, however it may be different depening on how **Java** is installed in the machine.

#### Important note Java LSP

The first time that a project is opened, it will take the **Java** version that was configured first, most likely the one specifiec in the **pom.xml** file.
If it is necesarry to make the **LSP** reload the project with a different version **Java**, then these are the recommendations:

  - **Delete** the file at the path: `~/.local/share/nvim/jdtls-workspace/<project_name>/.metadata/.plugins/org.eclipse.core.runtime/.settings/org.eclipse.jdt.launching.prefs`

If the previous didnt work, then delete the whole project directory at:

`~/.local/share/nvim/jdtls-workspace/<project_name>/.`

##### Lombok in jdtls


When using `lombok` packages, I had problems having autocompletion with code relateed to them, for example `getters` and `setters` of a class using `lombok` annotations.

To solve this, in the file `ftplugin/java.lua`, it is necessary to add the correct path for `javaagent` in the `cmd` section of the `config`.

Additional to delting the **file** or the whole **directory**, remember to change `pom.xml` file, and set the **JAVA_HOME** to the correct Java version.

## Java: Debugger

In the [nvim-jdtls repo](https://github.com/mfussenegger/nvim-jdtls) there is a specific part that describes how to make it compatible with [nvim-dap](https://github.com/mfussenegger/nvim-dap).
Making a summary we have to follows the following steps:

  1. Clone the [java-debug repo](https://github.com/microsoft/java-debug).
    1.1. Place it in a directory that fits best, will have to be referenced within the neovim configuration.
  2. Build the project using `Java JDK v21` and using the command `./mvnw clean install`.
  3. In the **neovim config file** at `~/.config/nvim/ftplugin/java.lua` make sure that the `bundles` set into the jdtls config have the following path (make sure that the path the you point is where you have the `java-debug` project built).  

      ```lua
      local home = os.getenv('HOME')
      local bundles = {
        vim.fn.glob(home .. "/.local/share/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
      }

      ...

      local config = {

        ...

        init_options = {
            bundles = bundles,
        },
        capabilities = capabilities,
      }
      require('jdtls').start_or_attach(config)
      ```
