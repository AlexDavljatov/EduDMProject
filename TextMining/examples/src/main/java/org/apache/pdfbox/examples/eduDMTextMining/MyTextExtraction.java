package org.apache.pdfbox.examples.eduDMTextMining;

import org.apache.lucene.document.Document;
import org.apache.pdfbox.examples.lucene.LucenePDFDocument;
import org.apache.pdfbox.exceptions.InvalidPasswordException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.pdfbox.util.PDFTextStripperByArea;

import java.awt.*;
import java.nio.file.Paths;
import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * User: Alex
 * Date: 08.01.14
 * Time: 17:21
 * To change this template use File | Settings | File Templates.
 */
public class MyTextExtraction {
    public static void main(String[] args) throws Exception {
//
        Document luceneDoc = LucenePDFDocument.
                getDocument(Paths.
                        get("C:\\Users\\Alex\\Desktop\\Diploma\\Project\\TextMiningConcrete\\demo2014.pdf").toFile());
        System.out.println(luceneDoc.toString());
//
        PDDocument document = null;
        try {
            document = PDDocument.
                    load("C:\\Users\\Alex\\Desktop\\Diploma\\Project\\TextMiningConcrete\\demo2014.pdf");
            if (document.isEncrypted()) {
                try {
                    document.decrypt("");
                } catch (InvalidPasswordException e) {
                    System.err.println("Error: Document is encrypted with a password.");
                    System.exit(1);
                }
            }
            PDFTextStripperByArea stripper = new PDFTextStripperByArea();
            stripper.setSortByPosition(true);
            Rectangle rect = new Rectangle(10, 280, 275, 60);
            stripper.addRegion("class1", rect);
            java.util.List allPages = document.getDocumentCatalog().getAllPages();
            PDPage firstPage = (PDPage) allPages.get(2);
            stripper.extractRegions(firstPage);
            System.out.println("Text in the area:" + rect);
//            System.out.println(stripper.getTextForRegion("class1"));
//            PDFTextStripper stripper = new PDFTextStripper();
//            System.out.println(document);
//            stripper.setStartPage(2);
//            stripper.setEndPage(3);
//            stripper.writeText();
            PDFTextStripper stripper1 = new PDFTextStripper();
            stripper1.setStartPage(4);
            stripper1.setEndPage(4);
            System.out.println("**********************\n" + stripper1.getText(document));
        } finally {
            if (document != null) {
                document.close();
            }
        }
    }

}
