gr = require "graph"



--

-- Formatted printing

--

local function printf(fmt, ...)

  print(string.format(fmt, unpack(arg)))

end



--

-- Convenience

--

local node, edge, subgraph, cluster, digraph, strictdigraph =

  gr.node, gr.edge, gr.subgraph, gr.cluster, gr.digraph, gr.strictdigraph



--

-- The definition of a graph

--

local g = strictdigraph{"G",

  compound = "1",

  rankdir = "LR",

  size="6.5,6.5",

  comment = "LuaGraph: exam2.lua",

  cluster{"c1",

    edge{

      node{"n1", comment="123"},

      node{"n2"},

      label = "n1-n2"

    },

  },

  cluster{"c2",

    edge{

      node{"m1"},

      node{"m2"},

      node{"m3"},

      label = "m1-m2-m3"

    },

    edge{"m3", "m1"},

  },

  node{"o1"},

  edge{"n1", "m2", ltail="cluster_c1", lhead="cluster_c2", label="comp"},

  edge{"n1","o1", "m1", label="nom"}

}



--

-- Show the graph using dotty

--

if true then

  local fn = os.tmpname()..".dot"

  g:write()

  g:write(fn)

  os.execute("dotty "..fn)

  os.remove(fn)

end

--

-- Make the layout using 'dot' (default) engine

--

print("Layout ...")

g:layout()



--

-- Render the graph into postscript format

--

print("Render ...")

g:render("ps", "out.ps")

g:render("gif", "out.gif")

g:render("svg", "out.svg")

g:render("png", "out.png")



--

-- Close the graph

--

print("Close ...")

g:close()

