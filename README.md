# Successfully configure neovim.

## Java LSP.
In the case of Java LSP (**jdlts**) I had to make some hard coded configs in the SDK paths to make it work.

  - nvim `JAVA_HOME`variable was set to **Corretto 21** in order to make jdlts work. This was made in **java.lua** file.
  - In **lsp-config.lua** I set the paths for the **Java runtimes**
  - In case of need, change the path of the **Java sdk**. By default it takes a path assuming that **SDKMAN** is installed, however it may be different depening on how **Java** is installed in the machine.


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
