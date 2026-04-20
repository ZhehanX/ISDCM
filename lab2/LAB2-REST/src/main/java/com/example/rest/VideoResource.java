package com.example.rest;

import com.example.rest.dao.VideoDAO;
import com.example.rest.model.Video;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import java.util.List;

@Path("/videos")
public class VideoResource {

    private VideoDAO videoDAO = new VideoDAO();

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public Response searchVideos(
            @QueryParam("title") String title,
            @QueryParam("author") String author,
            @QueryParam("year") Integer year,
            @QueryParam("month") Integer month,
            @QueryParam("day") Integer day) {
        
        List<Video> videos = videoDAO.search(title, author, year, month, day);
        return Response.ok(videos).build();
    }

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getVideoById(@PathParam("id") int id) {
        Video video = videoDAO.findById(id);
        if (video != null) {
            return Response.ok(video).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @POST
    @Path("/{id}/play")
    @Produces(MediaType.APPLICATION_JSON)
    public Response incrementPlayCount(@PathParam("id") int id) {
        boolean updated = videoDAO.incrementReproductions(id);
        if (updated) {
            return Response.ok().build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

    @PUT
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response updateVideo(@PathParam("id") int id, Video video) {
        video.setId(id);
        boolean updated = videoDAO.update(video);
        if (updated) {
            return Response.ok(video).build();
        } else {
            return Response.status(Response.Status.NOT_FOUND).build();
        }
    }
}
