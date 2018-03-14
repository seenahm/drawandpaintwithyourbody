void DrawOutlines(color c, float thickness) {

  noFill(); 
  //stroke(150, 20); 
  //strokeWeight(1); 
  Blob SecondBlob;
  EdgeVertex edgeC, edgeD;
  for (int n = 0; n < blobdetection.getBlobNb(); n++) {
    beginShape();
    stroke(150, 20); 
    strokeWeight(1); 
    SecondBlob = blobdetection.getBlob(n);
    if (SecondBlob != null) {  
      for (int m = 0; m < SecondBlob.getEdgeNb(); m+=20) {
        edgeC = SecondBlob.getEdgeVertexA(m);
        edgeD = SecondBlob.getEdgeVertexB(m);
        if (edgeC !=null && edgeD !=null) {
          curveVertex(edgeC.x*width, edgeC.y*height);
        }
      }
    }
    endShape();
  }
}