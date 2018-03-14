void drawBlobsAndEdges(color c, float thickness) {
  //fill (R, G, B, 5); 
  noStroke(); 
  Blob FirstBlob;
  EdgeVertex edgeA, edgeB;
  for (int n = 0; n < blobdetection.getBlobNb(); n++) {
    beginShape();
    fill (R, G, B, 5); 
    FirstBlob = blobdetection.getBlob(n);
    if (FirstBlob != null) { 
      for (int m = 0; m < FirstBlob.getEdgeNb(); m+=5) {
        edgeA = FirstBlob.getEdgeVertexA(m);
        edgeB = FirstBlob.getEdgeVertexB(m);
        if (edgeA !=null && edgeB !=null) {
          curveVertex(edgeA.x*width, edgeA.y*height);
        }
      }
    }
    endShape();
  }
}