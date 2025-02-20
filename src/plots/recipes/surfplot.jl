@userplot SurfPlot

RecipesBase.@recipe function f(p::SurfPlot)
    if length(p.args) != 1 || !(typeof(p.args[1]) <: PSAStruct)
        error("surfplot must be given a PSAStruct. Got $(typeof(p.args))")
    end
    ps_data = p.args[1]
    zoom = ps_data.zoom_list[ps_data.zoom_pos]
    if !zoom.computed
        return
    end
    
    @series begin
        seriestype := :surface
        zoom.x, zoom.y, -log10.(zoom.Z)
    end
end