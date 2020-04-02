package com.test.dto;

public class Score {
	
	private String name;
	private int kor;
	private int eng;
	private int math;
	private int sum;
	private double avg;
	private String grade;
	
	public Score() {
	}
	
	public Score(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
		setSum();
		setAvg();
		setGrade();
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getSum() {
		return sum;
	}

	public void setSum() {
		sum= kor+eng+math;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg() {
		avg= sum /3.0;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade() {
		
		switch ((int)avg/10) {
		
		case 10 : 
		case 9 :
			grade = "A";
			break;

		case 8 : 
			grade = "B";
			break;
			
		case 7 : 
			grade = "C";
			break;
		
		case 6 : 
			grade = "D";
			break;
			
		default: 
			grade = "F";
			break;
		}
	}

	@Override
	public String toString() {
		return "Score [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + ", sum=" + sum + ", avg="
				+ avg + ", grade=" + grade + "]";
	}
	
	

}
