package utils.testrail.entities;

import java.awt.image.BufferedImage;

public class Screenshot {

    private BufferedImage image;
    private String fileName;

    public Screenshot(BufferedImage image, String fileName) {
        this.fileName = fileName;
        this.image = image;
    }

    public BufferedImage getImage() {
        return image;
    }

    public void setImage(BufferedImage image) {
        this.image = image;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
}
